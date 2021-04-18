#!/bin/bash

echo 'こんにちは。私の名前はLinuxaよ'
echo '私とじゃんけんしなさい'
echo '早くあなたの出す手を決めなさい'
echo -ne "グー: r \nチョキ: s \nパー: p \n"
echo -n "あなたの手 : "
while read input; do
  case "$input" in
    "r")
      hand='グー'
      human_hand=0;;
    "s")
      hand='チョキ'
      human_hand=1;;
    "p")
      hand='パー'
      human_hand=2;;
    *)
      echo -ne "入力に誤りがあるわ。もう一度入力しなさい。\n"
      echo -ne "グー: r \nチョキ: s \nパー: p \n"
      continue;;
    esac

  echo "OK あなたは $hand でいいね"
  computer_hand=$(($RANDOM % 3))

  if [ $computer_hand -eq 0 ]; then
    echo '私はグーよ'
  elif [ $computer_hand -eq 1 ]; then
    echo '私はチョキだわ'
  elif [ $computer_hand -eq 2 ]; then
    echo '私はパーにするわ'
  else
    echo "私は壊れてしまったようだわ"
    break
  fi


  c=$((($human_hand - $computer_hand + 3) % 3))
  if [ $c -eq 0 ]; then
    echo '引き分けね'
    echo 'あなたの出す手をもう一度決めなさい'
  elif [ $c -eq 2 ]; then
    echo 'あなたの勝ちね'
    break
  else
    echo 'あなたの負けね。やり直してきなさい'
    break
  fi
done
