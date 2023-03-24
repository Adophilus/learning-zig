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

pub fn mergeSort(nums: []u8, start: u8, end: u8) void {
    if (end - start == 1)
        return;

    const mid = (end + start) / 2;

    mergeSort(nums, start, mid);
    mergeSort(nums, mid, end);

    // print("start={}, end={}, mid={}\n", .{ start, end, mid });

    var i = start;
    var j = mid;

    while (i < mid and j < end) {
        if (nums[i] > nums[j]) {
            // print("\n", .{});
            // printNumbers(nums);
            // print("swapping nums[i={}] <==> nums[j={}] = {} <==> {}\n", .{ i, j, nums[i], nums[j] });

            const temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;

            // printNumbers(nums);
            // print("\n", .{});

            i += 1;
        }else {
            i += 1;
            j += 1;
        }
    }
}

pub fn main() void {
    // var nums1 = [_]u8{ 3, 2, 7, 1, 0, 9, 10, 14 };
    var nums2 = [_]u8{ 5, 3, 6, 2, 7, 26 ,3, 67, 34, 246, 73, 21 };
    // var nums3 = [_]u8{ 34, 52, 13, 52, 14, 63, 54, 43, 234, 25 };
    print("Before: ", .{});
    // printNumbers(&nums1);
    printNumbers(&nums2);
    // printNumbers(&nums3);

    // mergeSort(&nums1, 0, nums1.len);
    mergeSort(&nums2, 0, nums2.len);
    // mergeSort(&nums3, 0, nums3.len);

    print("After: ", .{});
    // printNumbers(&nums1);
    printNumbers(&nums2);
    // printNumbers(&nums3);
}

// test "merge sort implementation" {
//     @assert()
//
// }
