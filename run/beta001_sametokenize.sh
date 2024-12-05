#export NCCL_IB_GID_INDEX=3
#export NCCL_IB_SL=3
#export NCCL_CHECKS_DISABLE=1
#export NCCL_P2P_DISABLE=0
#export NCCL_IB_DISABLE=0
#export NCCL_LL_THRESHOLD=16384
#export NCCL_IB_CUDA_SUPPORT=1
#export NCCL_IB_HCA=mlx5_bond_1,mlx5_bond_5,mlx5_bond_3,mlx5_bond_7,mlx5_bond_4,mlx5_bond_8,mlx5_bond_2,mlx5_bond_6
#export NCCL_COLLNET_ENABLE=0
#export SHARP_COLL_ENABLE_SAT=0
#export NCCL_NET_GDR_LEVEL=2
#export NCCL_IB_QPS_PER_CONNECTION=4
#export NCCL_IB_TC=160
#export NCCL_PXN_DISABLE=1
#ACCELERATE_LOG_LEVEL=info
#export CUDA_VISIBLE_DEVICES=0,1,2,3
#nohup  scripts/run_dpo.py recipes/zephyr-selm/dpo_config_full.yaml  model_name_or_path=/apdcephfs_cq10_1567347/share_1567347/share_info/llm_models/zephyr-7b-sft-full  hub_model_id=zephyr-7b-Database-Cal-DPO-average-beta1-handbook-torch2.1selm1_bs1 output_dir=/apdcephfs_cq10_1567347/share_1567347/mingxiaoli/tmp_data/outputs_models/zephyr-7b-Database-Cal-DPO-average-beta1-handbook-torch2.1selm1_bs16 loss_type=Cal-DPO-average beta=1.0 gradient_accumulation_steps=2 per_device_train_batch_size=16 > logs/1.log  2>&1 &
#

config_file=recipes/zephyr-selm/dpo_config_full.yaml
deepspeed_config=recipes/accelerate_configs/deepspeed_zero3_o.yaml
run_name=zephyr-7b-Database-Cal-DPO-beta001-sametokenize
model_name_or_path=/apdcephfs_cq10_1567347/share_1567347/share_info/llm_models/zephyr-7b-sft-full
output_dir=/apdcephfs_cq10_1567347/share_1567347/mingxiaoli/tmp_data/outputs_models/zephyr-7b-Database-Cal-DPO-beta001-sametokenize-caldpo
loss_type=Cal-DPO
beta=0.001
gradient_accumulation_steps=2
per_device_train_batch_size=8
learning_rate=5e-7
log_file=logs/zephyr-7b-Database-Cal-DPO-beta001-sametokenize-caldpo.out
ACCELERATE_LOG_LEVEL=info
echo " accelerate launch --config_file ${deepspeed_config}   scripts/run_dpo.py ${config_file} run_name=${run_name}  model_name_or_path=${model_name_or_path} output_dir=${output_dir} loss_type=${loss_type} beta=${beta} gradient_accumulation_steps=${gradient_accumulation_steps} per_device_train_batch_size=${per_device_train_batch_size} learning_rate=${learning_rate} > ${log_file} 2>&1"
nohup accelerate launch --config_file ${deepspeed_config}   scripts/run_dpo.py ${config_file} run_name=${run_name}  model_name_or_path=${model_name_or_path} output_dir=${output_dir} loss_type=${loss_type} beta=${beta} gradient_accumulation_steps=${gradient_accumulation_steps} per_device_train_batch_size=${per_device_train_batch_size} learning_rate=${learning_rate} > ${log_file} 2>&1 &