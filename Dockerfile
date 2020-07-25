FROM quay.io/wire/alpine-git
RUN git clone git://github.com/samtools/htslib.git \
	&& git clone git://github.com/samtools/bcftools.git
RUN apk update \
	&& apk add autoconf automake make gcc musl-dev perl bash zlib-dev bzip2-dev xz-dev curl-dev libressl-dev gsl-dev perl-dev
RUN cd bcftools \
	&& make \
	&& make install	
RUN mkdir /data
COPY afr-small.vcf /data/afr-small.vcf
CMD bcftools

