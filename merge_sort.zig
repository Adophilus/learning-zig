const std = @import("std");
const print = std.debug.print;

pub fn printNumbers(nums: []const u8) void {
    print("[ ", .{});
    for (nums) |num, index| {
        print("{}", .{num});
        if (index != nums.len - 1)
            print(", ", .{});
    }
    print(" ]\n", .{});
}

pub fn mergeSort(input: []u8) []u8 {
    var nums:[]u8 = undefined;
    std.mem.copy(u8, nums[0..input.len], input);

    if (nums.len == 1)
        return nums;

    const mid = input.len / 2;

    const left_half = mergeSort(input[0..mid]);
    const right_half = mergeSort(input[mid..]);
    _ = left_half;
    _ = right_half;

    var j = mid;
    var k = start;

    while (j < end) {
        if (nums[k] < nums[j]) {
            k += 1;
        } else {
            const temp = nums[j];
            var i = j;
            while (i > k) {
                nums[i] = nums[i - 1];
                i -= 1;
            }
            nums[k] = temp;
            k += 1;
            j += 1;
        }
    }
}

pub fn main() void {
    var nums1 = [_]u8{ 3, 2, 7, 1, 0, 9, 10, 14 };
    var nums2 = [_]u8{ 5, 3, 6, 2, 7, 26, 3, 67, 34, 246, 73, 21 };
    var nums3 = [_]u8{ 34, 52, 13, 52, 14, 63, 54, 43, 234, 25 };
    print("Before:\n", .{});
    printNumbers(&nums1);
    printNumbers(&nums2);
    printNumbers(&nums3);

    mergeSort(&nums1, 0, nums1.len);
    mergeSort(&nums2, 0, nums2.len);
    mergeSort(&nums3, 0, nums3.len);

    print("After:\n", .{});
    printNumbers(&nums1);
    printNumbers(&nums2);
    printNumbers(&nums3);
}
