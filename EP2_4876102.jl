using Test

function checkKaprekar()
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
