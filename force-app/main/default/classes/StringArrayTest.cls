public class StringArrayTest {
    public static List<string> generateStringArray(Integer n) {
        List<string> returnList = new List<string>();        
        for(integer i=0; i<n;i++){           
            returnList.add('Test '+i);
        }
        return returnList;
    }
}