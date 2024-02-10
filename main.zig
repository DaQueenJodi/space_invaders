const std = @import("std");
const c = @import("c.zig");


pub fn main() !void {
    if (c.SDL_Init(c.SDL_INIT_VIDEO | c.SDL_INIT_EVENTS) < 0) {
        SDLDie("failed to initialize SDL");
    }
    defer c.SDL_Quit();
}

fn SDLDie(msg: []const u8) noreturn {
    std.log.err("{s}: {s}", .{msg, c.SDL_GetError()});
    std.process.exit(1);
}
