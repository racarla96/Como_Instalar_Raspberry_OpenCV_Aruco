# Script automático de instalación de OpenCV 4.5.2 y Aruco 3.1.12 en Raspberry Pi OS para su uso con C++ y Python.

## Testeado con
- Raspberry Pi 3B+
- Raspberry Pi OS with desktop or Lite
- Webcam compatible con Linux (USB video class (UVC))

El script descarga OpenCV y realiza una compilación que facilmente puede tardar unas 5 horas para la Raspberry Pi 3B+.

Se recomienda modificar los parametros de compilación si se utiliza una Raspberry Pi 4, pudiendo accelerar bastante el proceso de compilación.

## TODO:
- [ ] Incluir ejemplos de OpenCv con C++ (para saber como usarlo en un proyecto).
- [ ] Incluir ejemplos de Aruco con C++ (para saber como usarlo en un proyecto).
- [ ] Incluir ejemplos de OpenCv con Python.
- [ ] Incluir ejemplos de Aruco con Python.
- [ ] Añadir bibliografía de Aruco y OpenCV.

## Enlaces empleados:
- https://www.uco.es/investiga/grupos/ava/node/26
- https://learnopencv.com/install-opencv-4-on-raspberry-pi/
- https://peppe8o.com/run-raspberry-pi-os-lite-gui-applications-from-remote-windows-pc/

## Nota:
Si tienes instalado Raspberry Pi OS Lite. Puedes añadir X11 display forwarding para ver la salida de video por ssh. (https://peppe8o.com/run-raspberry-pi-os-lite-gui-applications-from-remote-windows-pc/)

Recuerdar modificar la configuración ssh (/etc/ssh/sshd_config):

- sudo nano /etc/ssh/sshd_config

y añade al fichero o descomenta las siguientes variables:

- AllowTcpForwarding yes
- X11Forwarding yes







