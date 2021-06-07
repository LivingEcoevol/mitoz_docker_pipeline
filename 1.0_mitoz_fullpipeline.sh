# Notes: Run this docker version of mitoz on the PAWSEY machine 18-Feb-2021 Living Li
# Download the MitoZ docker image
docker pull guanliangmeng/mitoz:2.4-alpha

# Fire the image, map working directory to /data/living
docker run -v /data/living:/project --name mitoZ -it guanliangmeng/mitoz:2.4-alpha

# Modify the docker image (only need to do it once!)
# Install vim in the container
apt-get update
apt-get install vim
vi /app/release_MitoZ_v2.4-alpha/bin/common/genbank_gene_stat_v2.py
# Then delete 'ass_num' in genbank_gene_stat_v2.py
# Save and exit

# Save modified docker image
docker commit b2f72472541b mitoz_v2.4_mod

# Remove the running container
docker rm -f mitoZ

# Fire the modified docker image
docker run -v /data/living/barcode:/project --name mitoZ -it mitoz_v2.4_mod

mkdir mitoz
cd mitoz
cp ../sample_names.txt .
cp ../1.1_mitoz.sh .

# Run!
nohup bash 1.1_mitoz.sh >nohup_mitoz.txt&


