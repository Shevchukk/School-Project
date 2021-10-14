public class MathUtils {
    public static Decimal calculateAverage(List<Decimal> nums) {
        Decimal sum = 0;
        for (Decimal i : nums) {
            sum += i;
        }
        if(nums.size() > 0) {
        	//System.debug(sum/nums.size());
       	 	return sum/nums.size();
        }
        else {
            //System.debug('List is empty');
            return 0.0;
        }
    }
}