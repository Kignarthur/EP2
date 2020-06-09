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

function checkWill(cards)

    v = zeros(Int, 10)

    for index in 1 : length(cards)
        if cards[index] != 0
            v[cards[index]] += 1
        end
    end

    if v[1] == 0 || v[4] == 0 || v[6] == 0 || v[7] == 0
        return false
    else
        return true
    end

end

checkWillNumber()

function checkTaki(cards)

    v = zeros(Int, 10)

    for index in 1 : length(cards)
        if cards[index] != 0
            v[cards[index]] += 1
        end
    end

    if v[1] < 3 || v[4] < 1 || v[6] < 1 || v[7] < 3
        return false
    else
        return true
    end

end

checkTakiNumber()

function minValueLoader( x , minValue, cards )

    digitsJackson = digits(x)
    sizeJackson = length(digitsJackson)

    if length(cards) < 8 + sizeJackson
        return false
    end

    minValue[1 + 1] = 3
    minValue[4 + 1] = 1
    minValue[6 + 1] = 1
    minValue[7 + 1] = 3

    for index in 1 : sizeJackson
        minValue[digitsJackson[index] + 1] += 1
    end

    return true

end

function checkJackson(x, cards)

    sizeVector = 10
    v = zeros(Int, sizeVector)
    minValue = zeros(Int, sizeVector)

    for index in 1 : length(cards)
        v[cards[index] + 1] += 1
    end

    if !minValueLoader( x, minValue, cards )
        return false

    else

        for index in 1 : sizeVector
            if v[index] < minValue[index]
                return false
            end
        end

        return true

    end

end

checkJacksonNumber()
