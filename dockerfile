# Fetch a new image from alpine version 3.20
FROM alpine:3.20.3

# Document the purpose of the image and any additional details
LABEL maintainer="Diego <diego.perez@modular-mx.com>"
LABEL description="Docker image for running OpenOCD for GDB, Telnet and Tcl connections"

# install openocd version 12.0 revision 4
RUN apk add openocd=0.12.0-r4

# expose openocd ports to accept connection from GDB 3333,
# Telnet 4444 and Tcl 5555
EXPOSE 3333
EXPOSE 4444
EXPOSE 5555

# Parameters to select board and IP address 
ENV IP_ADDR=localhost
ENV BOARD=board/st_nucleo_g0.cfg

# open a openocd connection
CMD [ "sh", "-c", "openocd -f ${BOARD} -c \"bindto ${IP_ADDR}\"" ]

