using Test

function checkWillNumber()
    @test checkWill([]) == false
    @test checkWill([0, 1]) == false
    @test checkWill([1, 4, 6]) == false
    @test checkWill([0, 1, 2, 3, 4, 5, 7, 8, 9])== false
    @test checkWill([0, 4, 0, 7]) == false
    @test checkWill([1, 9, 6, 9]) == false
    @test checkWill([7, 4, 6, 7]) == false
    @test checkWill([1, 7, 6, 4]) == true
    @test checkWill([7, 4, 1, 6]) == true
    @test checkWill([4, 7, 1, 6]) == true
    @test checkWill([1, 4, 6, 7, 1, 4, 6, 7]) == true
    @test checkWill([1, 2, 3, 4, 5, 6, 7, 8, 9]) == true
    @test checkWill([0,0,0,0,0,0,0,0,0,0,0,0,0,6,1,7,4]) == true
    println("OK")
end

function checkTakiNumber()
    @test checkTaki([]) == false
    @test checkTaki([0, 1]) == false
    @test checkTaki([1, 4, 6]) == false
    @test checkTaki([0, 1, 2, 3, 4, 5, 7, 7, 8, 9]) == false
    @test checkTaki([1, 2, 3, 4, 5, 6, 7, 8, 9]) == false
    @test checkTaki([0, 4, 0, 7]) == false
    @test checkTaki([1, 9, 6, 9]) == false
    @test checkTaki([7, 4, 6, 7]) == false
    @test checkTaki([1, 1, 7, 7]) == false
    @test checkTaki([1, 1, 1, 4, 6, 7, 7, 7]) == true
    @test checkTaki([0, 1, 4, 7, 1, 4, 7, 1, 4, 7, 1, 6, 0]) == true
    @test checkTaki([1, 4, 6, 7, 1, 4, 6, 7, 7, 1, 9]) == true
    @test checkTaki([7,7,1,1,0,0,0,0,0,0,0,0,0,0,0,0,6,1,7,4]) == true
    println("OK")
end

function checkJacksonNumber()
    @test checkJackson(100,[]) == false
    @test checkJackson(3,[0, 1]) == false
    @test checkJackson(14,[1, 4, 6, 7, 1, 1, 7, 7]) == false
    @test checkJackson(15,[1, 1, 7, 7, 1, 0, 0, 0]) == false
    @test checkJackson(92,[0, 1, 2, 3, 4, 5, 7, 7, 8, 9]) == false
    @test checkJackson(65,[1, 2, 3, 4, 5, 6, 7, 8, 9]) == false
    @test checkJackson(35,[0, 4, 0, 7]) == false
    @test checkJackson(89,[1, 9, 6, 9]) == false
    @test checkJackson(79,[7, 4, 6, 7]) == false
    @test checkJackson(323846264,[1, 1, 7, 7]) == false
    @test checkJackson(31415, [1, 3 ,6, 5, 1, 1, 7, 4, 7, 7, 1, 1, 1, 2, 3, 4, 4]) == true
    @test checkJackson(0,[0, 1, 4, 7, 1, 4, 7, 1, 4, 7, 1, 6, 0]) == true
    @test checkJackson(123456789,[1, 2, 3, 4, 5, 6, 7, 8, 9,1, 6, 7, 1, 4, 6, 7, 7, 1, 9]) == true
    @test checkJackson(227,[7,7,1,1,0,0,0,2,0,2,0,7,0,0,0,0,6,1,7,4]) == true
    println("OK")
end

function checkWillNumberBase()
    @test checkWillBase(1,[0,1,2,3,4,5,6,7,8,9]) == false
    @test checkWillBase(2,[6, 1, 7, 4]) == false
    @test checkWillBase(2,[1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 9]) == false
    @test checkWillBase(3,[0, 2, 1, 1, 0, 2, 2, 9]) == false
    @test checkWillBase(4,[1, 2, 0, 3, 1, 0, 9]) == false
    @test checkWillBase(5,[4, 4, 1, 4, 1, 9]) == false
    @test checkWillBase(6,[3, 4, 4, 3, 9]) == false
    @test checkWillBase(7,[0, 0, 0, 2, 9]) == false
    @test checkWillBase(8,[6, 0, 3, 1, 9]) == false
    @test checkWillBase(9,[4, 0, 2, 9]) == false
    @test checkWillBase(10,[1, 6, 7, 0]) == false
    @test checkWillBase(11,[0,1,2,3,4,5,6,7,8,9]) == false
    @test checkWillBase(2,[0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1]) == true
    @test checkWillBase(3,[0, 2, 1, 0, 2, 2, 0, 1]) == true
    @test checkWillBase(4,[0, 2, 3, 2, 1, 1, 0]) == true
    @test checkWillBase(5,[4, 4, 4, 4, 1, 1]) == true
    @test checkWillBase(6,[4, 3, 0, 4, 3]) == true
    @test checkWillBase(7,[4, 2, 0, 0, 0]) == true
    @test checkWillBase(8,[0, 3, 1, 4, 6]) == true
    @test checkWillBase(9,[2, 4, 0, 8]) == true
    @test checkWillBase(10,[1, 7, 4, 6]) == true
    println("OK")
end

function checkFriendsNumber()
    @test checkFriends([], []) == nothing
    @test checkFriends([], [2]) == nothing
    @test checkFriends([2], []) == nothing
    @test checkFriends([2], [2]) == nothing
    @test checkFriends([8,100], [6,1,7,4]) == nothing
    @test checkFriends([42,333], [3,3,3,4,2]) == nothing
    @test checkFriends([0, 0], [6,7,1,4,0,0]) == []
    @test checkFriends([1234], [6, 1, 7, 4, 7, 7, 1, 1, 1, 2, 3, 4]) == [7, 7, 1, 1]
    @test checkFriends([123456789,0], [6,7,1,4,9,8,7,3,5,4,6,1,2,0,1]) == [1]
    @test checkFriends([3,14,15,92,65], [3,1,4,1,5,9,2,6,5,3,5,8,6,1,4,7]) == [3,5,8]

    println("OK")
end

# --------------- Tests End ---------------

function minimumValues(favoriteNumbers)

    minValVector = zeros(Int, 10)

    for index in 1 : length(favoriteNumbers)

        digitsVector = digits(favoriteNumbers[index])

        for digtIndex in 1 : length(digitsVector)

            minValVector[ digitsVector[digtIndex] + 1 ] += 1

        end

    end

    return minValVector
end

function areThereEnoughCards(minValVector, cards)

    vectorSize = 10
    vector = zeros(Int, vectorSize)

    for index in 1 : length(cards)
        vector[ cards[index] + 1 ] += 1
    end

    for index in 1 : vectorSize
        if vector[index] < minValVector[index]
            return false
        end
    end

    return true
end

# --------------- WILL ---------------

function checkWill(cards)

    favoriteNumbers = [6174]
    return areThereEnoughCards(minimumValues(favoriteNumbers), cards)

end

checkWillNumber()

# --------------- TAKI ---------------

function checkTaki(cards)

    favoriteNumbers = [6174,7711]
    return areThereEnoughCards(minimumValues(favoriteNumbers), cards)

end

checkTakiNumber()

# --------------- JACKSON ---------------

function checkJackson(x, cards)

    favoriteNumbers = [6174,7711,x]
    return areThereEnoughCards(minimumValues(favoriteNumbers), cards)

end

checkJacksonNumber()

# --------------- WILL AGAIN ---------------

function decimalToBasis(decimal, base)

    exp::BigInt = 1
    num::BigInt = 0

    while ( decimal != 0 )
        mod = decimal % base
        num += mod * exp
        exp *= 10
        decimal = div(decimal,base)
    end

    return num

end

function checkWillBase(b, cards)

    if b < 2 || b > 10
        return false
    end

    favoriteNumbers = [decimalToBasis(6174, b)]
    return areThereEnoughCards(minimumValues(favoriteNumbers), cards)

end

checkWillNumberBase()

# --------------- WILL AND FRIENDS ---------------

function remainingCards(indexBasedComparator, cards)

    placeHolder = []

    for index in  1 : length(cards)

        if  indexBasedComparator[ cards[index] + 1 ] > 0
            indexBasedComparator[ cards[index] + 1 ] -= 1
        else
            push!(placeHolder,cards[index])
        end

    end

    return placeHolder
end


function checkFriends(numbers, cards)

    push!(numbers,6174)
    indexBasedComparator = minimumValues(numbers)

    areThereEnoughCards(indexBasedComparator, cards) ?
        remainingCards(indexBasedComparator, cards) : nothing

end

checkFriendsNumber()
