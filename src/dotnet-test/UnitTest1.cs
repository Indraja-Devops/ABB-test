using Xunit;
using MyApp; // Namespace from your main project

public class UnitTest1
{
    [Fact]
    public void Test1_Passes()
    {
        Assert.Equal(4, 2 + 2);
    }
}