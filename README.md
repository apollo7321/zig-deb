# Zig Debian Package

**Unofficial Debian package for Zig**

This repository provides scripts to repackage the official Zig binary tarball as a Debian package (`*.deb`).

Current version: **0.14.1**.

---

## Requirements

Tested on **Debian 13.1 (Trixie)**.

Install dependencies with:

```bash
sudo apt install build-essential devscripts debhelper minisign
```

## Usage

Run:

```
./debian/build.sh
```

## License

 - Zig: MIT License (copyright held by Zig developers).
 - Packaging scripts: MIT License.
