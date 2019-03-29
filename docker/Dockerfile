FROM scratch

COPY rootfs/ /

# COPY extra-libs/ /usr/lib/
# COPY libmali-midgard-t86x-r14p0-r0p0-x11-gbm.so /usr/lib/libmali.so

COPY startup.sh /

VOLUME [ "/sys/fs/cgroup" ]

RUN chmod 777 /startup.sh
CMD ["bash","/startup.sh"]
