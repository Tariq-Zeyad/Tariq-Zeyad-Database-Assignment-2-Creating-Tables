using System;
using System.Collections.Generic;
using System.Text;

namespace Database
{
    public class ProductExceptSelf
    {
        public int[] ProductExceptSelf1(int[] nums)
        {
            int n = nums.Length;
            int[] answer = new int[n];

            // Step 1: Calculate products from the left
            answer[0] = 1;

            for (int i = 1; i < n; i++)
            {
                answer[i] = answer[i - 1] * nums[i - 1];
            }

            // Step 2: Multiply by products from the right
            int rightProduct = 1;

            for (int i = n - 1; i >= 0; i--)
            {
                answer[i] *= rightProduct;
                rightProduct *= nums[i];
            }

            return answer;
        }
    }
}
