# ddp-scripts

## Installation
install the package with:

`git clone git@github.com:sehunjoo/ddp-batch.git`

run setup.sh script:

`./setup.sh`

## Decumentation

### spawn-batch

- This script can be used to submit multiple jobs to a cluster using a batch queueing system. This script is for creating a job script, submitting the job script, monitoring the job, and resubimtting/killing the job.
- This script is applicable to all applications, but is specifically designed for use with `airss.pl` and `crud.pl` in  _ab initio_ random structure searching ([AIRSS](https://www.mtg.msm.cam.ac.uk/Codes/AIRSS)) package and `forge` in ephemeral data derived potential ([EDDP](https://www.mtg.msm.cam.ac.uk/Codes/EDDP)) package.
- It creates `jobscript-program.sh` and `despawn-batch` files in the working directory. As soon as a job is started, a `.spawnpid.*` file is created for each subjob. The file contains details of each subjob.
- It automatically resubmits the job if the job is terminated due to the wall clock limit.
- For example, you can run a total of 20 instances of airss.pl jobs on 2 compute nodes, each of which has 40 cores,

  `nohup spawn-batch -nj 20 -nc 40 -sch slurm --partition standard --qos standard --time 24:00:00 --account e89-camm -command airss.pl -mpinp 4 -seed Li -max 100 &`

- The following command line can be used to stop the spawn-batch script and the running jobs. The `spawn-batch` script detects the STOP file, runs `despawn-batch` and stops itself.

  `touch STOP`
- For ARCHER2 and MICHAEL, you do not need to specify -sch, -nc, and options for scheduler. Those are automatically set but you can overwrite defaults by specifing the options.

### farm-batch

- This script is exactly same as `spawn-batch` script. This script is merely a counterpart to the `farm` script that is included in the EDDP package.

### gen-chain-batch

- This script is for generating `chain-batch` script, which is a `chain` script for batch queueing system. It basically replaces `spawn` and `despawn` with `spawn-batch` and `despawn-batch`.
- Usage

  Choose the type of scheduler (sge or slurm) and options that are suitable for your cluster/compute node in the script.

  Generate the chain-batch-cluster with:
 
  `./gen-chain-batch`
