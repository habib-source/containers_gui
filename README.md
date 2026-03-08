# Containers GUI

 Difrent methods of running GUI in containers

## 1. X11 Forwarding

This method allows you to run graphical applications from a container and display them directly on your Linux host's screen.

**Best for:**

* Linux users who want to run applications supported only on other distributions.
* Testing software in a containerized environment without cluttering the host system.
* Maximum performance (near-native rendering).

**Considerations:**

* **Isolation:** Lower isolation compared to VNC, as the container shares the host's X11 socket.
* **Compatibility:** Primarily intended for Linux hosts.(Thu You can run it in Windows with WSL and MacOs using XQuartz)

### Prerequisites

* Docker
* Docker Compose
* `XQuartz` for MacOs
* `WSL` for Windows

### Usage

1. Grant the container permission to access your X server:
```bash
xhost +local:docker

```


2. Navigate to the directory:
```bash
cd x11_forwarding

```


3. Launch the container:
```bash
docker-compose up --build

```

4. when you get done from it ungrant the permissions:
```bash
xhost -local:docker

```


---

## 2. VNC Server Container

This method sets up a headless environment inside the container using **TigerVNC**. You interact with the GUI through a VNC client (such as `tigervnc-viewer`).

**Best for:**

* **Security & Isolation:** The GUI is contained within a virtual desktop, providing a stronger boundary between the host and the container.
* **Cross-platform:** Can be accessed from any OS (Linux, macOS, Windows) using a VNC client.
* **Persistent Sessions:** The desktop environment can keep running even if you disconnect the client.

**Considerations:**

* **Network:** Requires a VNC client installed on your host machine.
* **Overhead:** Slightly higher resource usage than X11 forwarding due to the VNC server and window manager processes.

### Prerequisites

* Docker
* Docker Compose
* VNC client (e.g `tigervnc-viewer`)

### Usage

1. Navigate to the directory:
```bash
cd vnc_server_container

```


2. Launch the container:
```bash
docker-compose up --build

```


3. Connect using your preferred VNC viewer at `localhost:5901`:
```bash
vncviewer localhost:5901

```
