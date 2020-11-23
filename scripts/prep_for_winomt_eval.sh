#!/bin/bash
if [ $# -eq 0 ]; then
echo "Usage: bash prep_for_winomt_eval.sh hypothesis-to-prep target-language path-to-winomt";
exit 1
fi

OUTFILE=$1
LANG=$2
WINOMT_DIR=$3
OUTDIR=todecode
REF_WITH_DELIM="../data/prep_for_eval/winomt.withdelim.en"
eval_script="$WINOMT_DIR/scripts/evaluate_all_languages.sh"

sed -ri "s/mt_systems=\(.*\)/mt_systems=\(\"$OUTDIR\"\)/g" $eval_script
sed -ri "s/langs=\(.*\)/langs=\(\"$LANG\"\)/g" $eval_script

mkdir -p $WINOMT_DIR/translations/$OUTDIR
paste -d ' ' "$REF_WITH_DELIM" "$OUTFILE" > "$WINOMT_DIR/translations/$OUTDIR/"en-$LANG.txt

