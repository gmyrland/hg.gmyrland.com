rm -r public/
#aws s3 rm s3://hg.gmyrland.com-test/ --recursive

sudo docker build . -t hg.gmyrland.com
sudo docker run --rm \
    -v "$(pwd)":/home/site \
    --name hg.gmyrland.com-build \
    hg.gmyrland.com hugo
sudo chown -R glen:glen public/

#aws s3 sync public/ s3://hg.gmyrland.com-test/ --size-only --delete # test
aws s3 sync public/ s3://hg.gmyrland.com/ --delete # prod

# add robots.txt to test
aws s3 cp layouts/robots.txt s3://hg.gmyrland.com-test/robots.txt
