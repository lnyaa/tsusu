const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("tsusu", "src/main.zig");

    // ???
    //const exe_daemon = b.addExecutable("tsusud", "src/daemon.zig");
    //exe_daemon.setBuildMode(mode);
    //exe_daemon.install();

    exe.setBuildMode(mode);
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}