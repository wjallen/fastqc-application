# fastqc-application

### contents
.
├── Dockerfile
├── README.md
├── app.ini
└── fastqc-0.11.7
    ├── _util
    │   ├── VERSION
    │   └── container_exec.sh
    ├── app.json.j2
    ├── job.json.j2
    ├── runner-template.sh
    └── tester.sh


### clone
git clone https://github.com/wjallen/fastqc-application
cd fastqc-application/


### personalize
#### ./app.ini
=> change to your docker username / preferred repo and tag

#### ./fastqc-0.11.7/app.json.j2
=> change `executionSystem`, `deploymentSystem`, and `deploymentPath` if necessary

####./fastqc-0.11.7/runner-template.sh
=> change `CONTAINER_IMAGE` to your preferred repo source


### deploy
apps-deploy -E app.ini -f Dockerfile -a fastqc-0.11.7/app.json.j2 -j fastqc-0.11.7/app.json.j2 -T ./


### test
jobs-template username-fastqc-0.11.7 > job.json
jobs-submit -F job.json
jobs-output-list <jobid>

=> looking for `read1_fastqc.html`

