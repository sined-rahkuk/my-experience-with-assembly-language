# Načítajte z klávesnice reťazec znakov ukončený znakom "nového riadku". Slová vo vstupe sú oddelené najmenej jedným znakom "medzera". Uvažujte aj prvé, resp. posledné slovo vstupu. Určte počet slov obsahujúcich len písmená malej abecedy. Počet (0-255) vytlačte osmičkovo.

# Toto je moja veta. Spravnym vystupom na zaklade tejto vety je 9

# input_string = input();
input_string = 'cela veta je pisana malymi ale Nie Vsetka\n'

in_word_indicator = 0
conditions_broken = 0

matched_words_amount = 0


def check_for_amount_increment():
    global in_word_indicator
    global conditions_broken
    global matched_words_amount

    if(in_word_indicator != 0):
        if(conditions_broken == 0):
            matched_words_amount += 1
        in_word_indicator = 0
        conditions_broken = 0

for char in input_string:
    print("char: {}\n conditions broken: {}\n in_word_indicator: {}\n matched_words_amount: {}".format(
        char, conditions_broken, in_word_indicator, matched_words_amount))

    if(char == '\n'):
        check_for_amount_increment()
        print(matched_words_amount)
        exit()
    if(char == ' '):
        check_for_amount_increment()
        continue
    in_word_indicator = 1
    if(ord(char) < ord('a')):
        conditions_broken += 1
        continue
    if(ord(char) > ord('z')):
        conditions_broken += 1
        continue




