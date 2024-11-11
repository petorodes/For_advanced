#!/bin/bash

# Создание файла
echo "Hello, world!" > file.txt

# Инициализация git-репозитория
git init

# Первый коммит
git add file.txt
git commit -m "Initial commit"

# Генерация случайных изменений файла и коммитов (Цельный блок команд)
for ((i=1; i<=130; i++))
do
  # Рандомное изменение файла
  echo "Random change $i" >> file.txt

  # Добавление изменений и коммит
  git add file.txt
  git commit -m "Commit $i"

  # Получение предыдущей даты
  prev_date=$(date -d "$prev_date -1 day" +%Y-%m-%d)

  # Изменение даты последнего коммита
  GIT_COMMITTER_DATE="$prev_date 12:00:00" git commit --amend --no-edit --date "$prev_date 12:00:00"

  # Запоминание текущей даты для следующего цикла
  prev_date=$prev_date
done