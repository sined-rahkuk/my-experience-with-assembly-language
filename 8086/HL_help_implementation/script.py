def bubble_sort(sequence):
    for passnum in range(len(sequence)-1, 0, -1):
        for i in range(passnum):
            if sequence[i] > sequence[i+1]:
                temp = sequence[i]
                sequence[i] = sequence[i+1]
                sequence[i+1] = temp
    return sequence


def main():
    usr_inpt = input('Enter the sequence of numbers 00-99: ')
    list_of_num = usr_inpt.split(sep=' ')
    # list_of_num = list(map(lambda character: int(character), list_of_num))
    list_of_num = [int(character) for character in list_of_num]

    sorted = bubble_sort(list_of_num)
    print(sorted)
    # sorted_hex = list(map(lambda num: hex(num).replace('0x', '')+'h', sorted))
    sorted_hex = [hex(num).replace('0x', '')+'h' for num in sorted]
    print(sorted_hex)


if __name__ == "__main__":
    main()
