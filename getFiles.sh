##FIND correct locations of these:

#jni headers:
JNI_DIR=/usr/lib/jvm/java-6-openjdk/include/


#this tutorial should work on ubuntu 64 bit

#make sure we have certain libraries
sudo apt-get install gfortran



#wget http://netlib-java.googlecode.com/files/netlib-java-0.9.3.zip
#unzip netlib-java-0.9.3.zip
#cd netlib-java-0.9.3
svn checkout http://netlib-java.googlecode.com/svn/trunk/ netlib-java
cd netlib-java


ant clean generate compile package
cp lib/f2j/arpack-combo-*.jar lib/f2j/arpack-combined.jar
cd jni
sh configure
cp ../netlib*.jar ../netlib-java-dev.jar

#add jni dir to makefile's include
jni_replacement=$(printf "%s\n" "$JNI_DIR" | sed 's/[\&/]/\\&/g')
sed -e "s/CPPFLAGS=/CPPLAGS= -I${jni_replacement} -I. /g" Makefile.incl -i
sed -e "s/CFLAGS=/CFLAGS= -I${jni_replacement} -I. /g" Makefile.incl -i




#Get lapack source
#wget http://netlib.org/lapack/lapack-3.1.1.tgz
#tar xfz lapack-3.1.1.tgz
#cd lapack-3.1.1
#make FORTRAN="gfortran -fPIC" LOADER="gfortran -fPIC" OPTS="-fPIC -funroll-all-loops -O3" NOOPTS="-fPIC" lib
#cd ..


## ACML ##
#go here and download the gfortran version of the acml library:
#http://developer.amd.com/libraries/acml/downloads/pages/default.aspx
#mkdir acml
#mv acml*.tgz acml
#cd acml
#installs to /opt/acmlx.x.x by default
#sudo sh install-acml-*-gfortran-64bit-int64.sh


### Download and compile ATLAS ##

#wget http://sourceforge.net/projects/math-atlas/files/Stable/3.8.4/atlas3.8.4.tar.bz2/download
#mv download atlas3.tar.bz2
#tar -xjf atlas3.tar.bz2
#cd ATLAS


# 
# 
# 
# 
# wget http://belnet.dl.sourceforge.net/sourceforge/math-atlas/atlas3.7.30.tar.bz2
# tar xfj atlas3.7.30.tar.bz2
# cd ATLAS
# mkdir mybuild
# cd mybuild
# ../configure -Fa alg -fPIC --with-netlib-lapack=$PWD/../../lapack-3.1.1/lapack_LINUX.a
# make
# cd lib
# make ptshared
# cd ..
# sudo make install
# sudo install -m 755 lib/*.so /usr/local/atlas/lib/
# 
# sudo ln -sf /usr/local/atlas/lib/libcblas.a /etc/alternatives/libblas-3.a
# sudo ln -sf /usr/local/atlas/lib/libcblas.so /etc/alternatives/libblas-3.so
# sudo ln -sf /usr/local/atlas/lib/liblapack.a /etc/alternatives/liblapack-3.a
# sudo ln -sf /usr/local/atlas/lib/liblapack.so /etc/alternatives/liblapack-3.so
# sudo ldconfig


