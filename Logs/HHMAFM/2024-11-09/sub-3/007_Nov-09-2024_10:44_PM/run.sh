#!/usr/bin/env bash
for d in 'mvsa-mts-1000' # 'mvsa-mts' 'mvsa-mts-100' 'mvsa-mts-1000'
do
    for k in 'mfcchfusion' # 'mmfusion' 'cmhafusion' 'mfcchfusion' 'mfcchfusion2'
    do
        for j in 'train' # 'train' 'grid_search'
        do
            cd ${REPO_DIR}
            echo "SLURM Job ID: $SLURM_JOB_ID"
            PYTHONPATH=$PYTHONPATH:/home/rgg2706/Multimodal-Sentiment-Analysis/Models/HHMAFM/src/ \
            python -u -Wd Models/HHMAFM/src/${j}.py --dataset ${d} --model_name ${k} \
            --num_epoch 15 --batch_size 64 --log_step 60 --learning_rate 0.0003 --dropout_rate 0.1
        done
    done
done