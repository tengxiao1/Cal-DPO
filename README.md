## Cal-DPO: Calibrated Direct Preference Optimization for Language Model Alignment (NeurIPS 2024)


### Environment

First, install PyTorch `2.1.2` from the [PyTorch Installation Page](https://pytorch.org/get-started/locally/).

Create a Python virtual environment using e.g. Conda:

```shell
conda create -n Cal-DPO python=3.10 && conda activate Cal-DPO
```

```shell
python -m pip install flash-attn --no-build-isolation
```

## Training Scripts

```shell
ACCELERATE_LOG_LEVEL=info accelerate launch --config_file accelerate_configs/deepspeed_zero3.yaml scripts/run_dpo.py zephyr-selm/dpo_config_full.yaml

```


## Evaluation Benchmarks

* [Open LLM Leadboard](https://huggingface.co/spaces/open-llm-leaderboard-old/open_llm_leaderboard)

* [New Open LLM Leadboard](https://huggingface.co/spaces/open-llm-leaderboard/open_llm_leaderboard) 


##  Reference 

If you find our repo to be useful, please cite our paper:
```bibtex
@inproceedings{Cal-DPO2024,
  title={Cal-DPO: Calibrated Direct Preference Optimization for Language Model Alignment },
  author={Xiao, Teng and Yuan, Yige and Zhu, Huaisheng and Li, Mingxiao and Honavar, Vasant G},
  booktitle={The Thirty-eighth Annual Conference on Neural Information Processing Systems (NeurIPS)},
  year={2024}
}



