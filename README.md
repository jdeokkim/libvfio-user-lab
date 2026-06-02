```console
$ git clone https://github.com/nutanix/libvfio-user && cd libvfio-user
$ meson setup build -Ddefault_library=static && ninja -C build
$ sudo ninja -C build install
```