#!/bin/bash
# Usage:
#   evaluate_secondary.sh <baseline-translations> <gender-debiased-translations> <language>


#run from mt_gender/src, as running other scripts


baseline_trans=$1
debiased_trans=$2
lang=$3

../scripts/prep_for_winomt_eval.sh $baseline_trans $lang ..
../scripts/evaluate_all_languages.sh ../data/aggregates/en_secondary.txt out_logs/log

../scripts/prep_for_winomt_eval.sh $debiased_trans $lang ..
../scripts/evaluate_all_languages.sh ../data/aggregates/en_secondary.txt out_logs/log