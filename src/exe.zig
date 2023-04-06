const std = @import("std");
const io = @import("io.zig");

const xfunc = @import("transfer-functions.zig");
const util = @import("utils.zig");

const CHOICE = 49;
const NUM_FMT = "{d: <8.6}\t";

pub fn printPlot(
    comptime T: type,
    tfs: []*const xfunc.TransferFunction(T),
    itfs: []*const xfunc.InterpolatingTransferFunction(T),
) !void {
    const stream = std.io.getStdOut().writer();
    const n = if (tfs.len > 0)
        tfs[0].lower_branch[0].len
    else
        itfs[0].tf.lower_branch[0].len;

    var grid = util.relline_gstar_grid(f32);
    for (0..n) |i| {
        const x = grid[i];
        try stream.print(NUM_FMT, .{x});
        for (itfs) |tf| {
            const y1 = tf.cache_lower[i];
            const y2 = tf.cache_upper[i];
            try stream.print(NUM_FMT, .{y1});
            try stream.print(NUM_FMT, .{y2});
        }
        for (tfs) |tf| {
            const y1 = tf.lower_branch[CHOICE][i];
            const y2 = tf.upper_branch[CHOICE][i];
            try stream.print(NUM_FMT, .{y1});
            try stream.print(NUM_FMT, .{y2});
        }
        try stream.print("\n", .{});
    }
}

pub fn interpolation_test(allocator: std.mem.Allocator) !void {
    var data = try io.readFitsFile("../relline/rel_table.fits", allocator);
    defer data.deinit();

    // var params = [2]f32{ 0.638, 0.276 };
    // var itf = data.interpolate_parameters(params);
    data.interpolated_cache[0].assignFrom(&data.transfer_functions[229]);
    var itf = data.interpolated_transfer_function;
    itf.stage_radius(1.341e1);

    try printPlot(
        f32,
        &[_]*const xfunc.TransferFunction(f32){
            &data.transfer_functions[229],
        },
        &[_]*const xfunc.InterpolatingTransferFunction(f32){
            &itf,
        },
    );
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    var alloc = gpa.allocator();

    try interpolation_test(alloc);
}
