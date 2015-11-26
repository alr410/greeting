# Программа, которая приветствует пользователя по-разному в зависимости 
# от интервала времени суток, используя ассоциативные массивы.

# encoding: utf-8
if (Gem.win_platform?)
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__

    [STDIN, STDOUT].each do |io|
        io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
end

# Создадим ассоциативный массив приветствий в зависимости от времени суток
ar_greetings = {
    morning: 'Доброе утро, дружок!!!',
    day: 'Добрый день!!!',
    evening: 'Добрый вечер!!!',
    night: 'Не спи, замерзнешь!!!'
}

# Создадим хэш времени суток по соответствию со временем
ar_of_the_day = {
    morning: (6..9),
    day: (10..17),
    evening: (18..23),
    night: (0..5)
}

hour = Time.now.hour

# Проверим есть ли в хэше 'ar_of_the_day' значение 'hour'
ar_of_the_day.each_pair {|key, value|
    if value.include?(hour)
        puts "#{ar_greetings.fetch(key)}"
    end
}
