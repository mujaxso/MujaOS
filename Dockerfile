# ---- Builder: use Nix to build your app (flakes) ----
# Use the unstable tag to match your flake
FROM nixos/nix:unstable AS builder

# Enable flakes and set up workdir
ENV NIX_CONFIG="experimental-features = nix-command flakes"
WORKDIR /src

# Copy only inputs first for better caching
# If you have a flake-based repo:
COPY flake.nix flake.lock ./
# If you also have a nix/ dir with modules, include it:
# COPY nix ./nix

# Pre-build to warm caches; this doesn't copy your whole source yet
# Build the laptop NixOS configuration
RUN nix build .#nixosConfigurations.laptop.config.system.build.toplevel || true

# Now copy the rest of the source and build for real (cache helps)
COPY . .
RUN nix build .#nixosConfigurations.laptop.config.system.build.toplevel

# Collect Nix store closure for the build output
# "result" symlink points to the build output from nix build
RUN mkdir -p /tmp/nix-store-closure \
 && cp -R $(nix-store -qR result) /tmp/nix-store-closure

# ---- Final: minimal image with only closure and binary ----
FROM scratch

# Copy the full Nix store closure and the result output
COPY --from=builder /tmp/nix-store-closure /nix/store
COPY --from=builder /src/result /app

# Optional: set working directory
WORKDIR /app

# Default command to run your binary; adjust path/name if needed
# If your flake produces a package with bin/mujaos:
CMD ["/app/bin/mujaos"]
