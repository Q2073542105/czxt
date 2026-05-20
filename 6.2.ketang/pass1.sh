chmod +x /home/headless/Desktop/workspace/userfiles/pass2.sh
chmod +x /home/headless/Desktop/workspace/userfiles/pass3.sh
cp /home/headless/Desktop/workspace/userfiles/0.gdb-1 /home/headless/os/linux-0.11-lab/0.gdb
cp /home/headless/Desktop/workspace/userfiles/第一关.txt /home/headless/Desktop/workspace/myshixun/第一关.txt
cd /home/headless/os/linux-0.11-lab/
tar -zxvf /home/headless/Desktop/workspace/myshixun/exp1/2.tgz 
cd 2/linux 
make clean; make
cd ../..
rm cur
ln -s 2 cur
./rungdb