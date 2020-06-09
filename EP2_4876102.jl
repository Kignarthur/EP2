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

checkKaprekar()
