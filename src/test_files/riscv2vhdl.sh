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

riscv64-unknown-elf-as "$input" -o "${output}.o"
readarray -t instructions < <(riscv64-unknown-elf-objdump -d "${output}.o" | awk '/^....:/{print $2}')
rm "${output}.o"

name="imem_${output_basename// /_}"
total=1023
remainder=$((total - ${#instructions[@]}))

cat > "${output}.vhd" << EOF
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ${name} is
    port (
        address : in std_logic_vector (9 downto 0);
        Clock   : in std_logic;

        q       : out std_logic_vector (31 downto 0)
    );
end ${name};

architecture SYN of ${name} is
    type TMem is array (0 to ${total}) of std_logic_vector (31 downto 0);
    signal Mem : TMem := (
$(printf "      x\"%s\",\n" ${instructions[@]})
$(for i in $(eval echo "{1..${remainder}}"); do echo "      x\"00000000\","; done)
      x"00000000"
    );
begin
    process (Clock)
    begin
        if rising_edge(Clock) then
            q <= Mem(to_integer(unsigned(address)));
        end if;
    end process;
end;
EOF
