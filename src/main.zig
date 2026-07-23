const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const alloc = init.gpa;

    var rbuf: [1024]u8 = undefined;
    var reader: std.Io.File.Reader = .init(.stdin(), io, &rbuf);
    const stdin = &reader.interface;

    var wbuf: [1024]u8 = undefined;
    var writer: std.Io.File.Writer = .init(.stdout(), io, &wbuf);
    const stdout = &writer.interface;

    while (true) {
        if (stdin.takeDelimiter('\n') catch |err| return err) |input| {
            const parsed = try std.json.parseFromSlice(std.json.Value, alloc, input, .{});
            defer parsed.deinit();
            switch (parsed.value) {
                .object => |obj| try stdout.print("{any}\n", .{obj.keys()}),
                .array => |arr| try stdout.print("{any}\n", .{arr.items}),
                else => {},
            }
            try stdout.flush();
        } else break;
    }
}
