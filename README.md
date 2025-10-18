# MujaOS — Modular NixOS Configuration

**NixOS done right.** This flake-based configuration gives you declarative system management with bulletproof reproducibility. Clone it, build it, and get the exact same system every time—no surprises, no drift, no fragile scripts. Organized modularly so you can customize without breaking everything.

---

<div style="display: flex; justify-content: center; gap: 20px;">
  <div><img src="https://raw.githubusercontent.com/mujaxso/mujaos/main/assets/img/mujaos.png" alt="MujaOS Logo" ><br></div>
</div>

## 🚀 Features

- Declarative and reproducible NixOS setup  
- Flake-based configuration for modern Nix usage  
- Easy customization and system rebuilds  
- Modular structure for maintainability  
- Git versioned — simple rollback to previous states

---

## 🧩 Prerequisites

Before using this configuration, ensure you have:

- **Nix** installed with flakes enabled  
- **NixOS** 25.05 or newer (recommended)  
- Basic understanding of Nix expressions

---

## ⚙️ Installation

1. **Clone this repository**:

   ```bash
   git clone https://github.com/mujaxso/mujaos.git
   cd mujaos
   sudo nixos-rebuild switch --flake .#laptop --show-trace
