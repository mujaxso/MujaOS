# MujaOS — Modular NixOS Configuration

<div align="center">

![Release](https://img.shields.io/github/v/release/mujaxso/mujaos?color=007bff&label=Release&style=for-the-badge)
![NixOS Version](https://img.shields.io/badge/NixOS-25.05+-5277C3?style=for-the-badge&logo=nixos&logoColor=white)
![License](https://img.shields.io/github/license/mujaxso/mujaos?style=for-the-badge)
![CI](https://img.shields.io/github/actions/workflow/status/mujaxso/mujaos/ci.yml?branch=main&label=CI&style=for-the-badge)

<img src="https://raw.githubusercontent.com/mujaxso/mujaos/main/assets/img/mujaos.png" alt="MujaOS Logo" width="280"/>

### **Declarative. Modular. Reproducible.**

*A modern, flake-based NixOS configuration designed for clarity, maintainability, and reliability.*

[📦 Installation](#-installation) • [✨ Features](#-features) • [🧠 Philosophy](#-philosophy) • [🧩 Requirements](#-requirements) • [🧭 Structure](#-repository-structure) • [🤝 Contributing](#-contributing) • [📄 License](#-license)

</div>

---

<div style="display: flex; justify-content: center; gap: 20px;">
  <div><img src="https://raw.githubusercontent.com/mujaxso/mujaos/main/assets/img/mujaos.png" alt="MujaOS Logo" ><br></div>
</div>

---

## 🧠 Philosophy

**NixOS done right.**  
MujaOS delivers a clean, reproducible, and modular approach to NixOS configuration built around Nix flakes. It aims to make system management predictable and maintainable by design.

Key goals:

- 💡 Build and rebuild **identical systems** — every time.  
- 🧩 **Modular architecture** that’s easy to customize safely.  
- 🪶 **Lightweight, readable structure** for long-term maintainability.  
- 🔁 **Versioned configurations** — rollback to any state with Git.  

No fragile scripts. No “snowflake” systems. Just reproducible infrastructure as code.

---

## ✨ Features

- ⚙️ **Flake-based design** — modern, self-contained configuration  
- 🧩 **Modular system components** — plug-and-play modules for services and settings  
- 🧰 **User profiles** — separate user environments for clarity  
- 🔁 **Reproducible builds** — eliminate configuration drift  
- 🌐 **Multi-host support** — manage desktops, laptops, and servers from one repo  
- 🔒 **Security-focused defaults** — consistency meets hardening  
- 🪶 **Minimal boilerplate** — simple to read, simple to extend  

---

## 🧩 Requirements

Before you begin, make sure your environment meets the following:

### **Software Requirements**
- **Nix** ≥ 2.18 with [flakes enabled](https://nixos.wiki/wiki/Flakes)  
- **NixOS 25.05** or newer  
- **Git** for fetching and versioning  
- **sudo** privileges for system rebuilds  
- (Optional) `nix-command` enabled in `/etc/nix/nix.conf`  

### **Hardware Recommendations**
- Architecture: **x86_64** or **aarch64**  
- Memory: **2 GB+ RAM** (4 GB recommended)  
- Storage: **10 GB free disk space** minimum  
- Network: Reliable Internet connection for fetching dependencies  

### **Knowledge Requirements**
- Familiarity with:
  - Basic **Nix expressions** and the **NixOS module system**  
  - Using `nixos-rebuild` and `flake` commands  
  - **Git** workflow basics  
  - General **Linux system administration**  

> 💡 *New to NixOS? Start with [Nix Pills](https://nixos.org/guides/nix-pills/) or the [NixOS Flakes Wiki](https://nixos.wiki/wiki/Flakes).*

---

## 🚀 Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/mujaxso/mujaos.git
   cd mujaos
   ```

2. **Build and switch to your host configuration**

   ```bash
   sudo nixos-rebuild switch --flake .#laptop --show-trace
   ```

   Replace `laptop` with your target host name (as defined under `hosts/`).

3. **Reboot your system**

   Once rebuilt, reboot to load the new configuration.

---

## 🧭 Repository Structure

```
mujaos/
├── flake.nix              # Main Nix flake entrypoint
├── flake.lock             # Pin exact dependency versions
├── hosts/                 # Host-specific configurations
│   ├── laptop/            # Example laptop profile
│   └── server/            # Example server profile
├── modules/               # Modular components (network, desktop, etc.)
├── users/                 # User-specific configurations
├── overlays/              # Custom Nix package overlays
├── assets/                # Images, branding, and docs
└── README.md              # Project documentation
```

> 🧩 Each folder and module is self-contained for clarity and scalability. Add or remove hosts without affecting others.

---

## ⚙️ Example Usage

To rebuild or switch configurations:

```bash
sudo nixos-rebuild switch --flake .#desktop
```

To update flake inputs (e.g., Nixpkgs, Home Manager):

```bash
nix flake update
```

To test configurations without applying them:

```bash
sudo nixos-rebuild test --flake .#server
```

---

## 🤝 Contributing

Contributions are always welcome!  
Here’s how you can help improve MujaOS:

- 🐛 **Report bugs** — open an [issue](https://github.com/mujaxso/mujaos/issues)  
- 💡 **Suggest features** — share ideas to improve modularity or usability  
- 🔧 **Submit pull requests** — keep your commits clean and atomic  

> Please follow **conventional commits** (`feat:`, `fix:`, `docs:`, etc.) and ensure your changes remain modular.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).  
You’re free to use, modify, and distribute under the same terms.

---

<div align="center">

**MujaOS — Declarative, Modular, Reproducible.**  
Built with ❤️ for NixOS and the open-source community.

</div>
