#!/bin/bash

if [ "$1" == "" ]
then
    echo "Usage: $0 <input> <?output>"
    exit
fi

set -o errexit
set -o nounset

input="$1"
basename=$(basename "$input")
dirname=$(dirname "$input")
filename="${basename%.*}"

output="${2:-${dirname}/${filename}}"
output="${output%.*}"
output_basename=$(basename "$output")

tempDir=$(mktemp -d)
tempOutput="${tempDir}/${output_basename}.o"

riscv64-unknown-elf-as "$input" -o "${tempOutput}"
readarray -t instructions < <(riscv64-unknown-elf-objdump -d "${tempOutput}" | tee /dev/tty | awk '/^....:/{print $2}')
rm "${tempOutput}"

total=1023
remainder=$((total - ${#instructions[@]}))

cat > "${output}.coe" << EOF
;Initialization file for ${output_basename}
memory_initialization_radix = 16;
memory_initialization_vector =
$(printf "%s %s %s %s %s %s %s %s\n" ${instructions[@]} $(for i in $(eval echo "{0..${remainder}}"); do echo "00000000"; done))
EOF

#riscv64-unknown-elf-as $1 -o $FILENAME.o
#riscv64-unknown-elf-ld -Ttext 0 --entry=0 $FILENAME.o -o $FILENAME.elf
#$HERE/riscv-elf2altera.x -c $FILENAME.elf 4 1024 > $FILENAME.coe
