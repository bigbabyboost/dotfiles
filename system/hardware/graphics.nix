{pkgs, ...}: {
  # graphics drivers / HW accel
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      vaapiIntel
      libva
      intel-media-driver
      intel-media-sdk
      intel-compute-runtime-legacy1
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      libva
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
    LIBVA_DRIVERS_PATH = "${pkgs.intel-media-driver}/lib/dri";
    VKD_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/intel_icd/x86_64.json";
    OCL_ICD_VENDORS = "${pkgs.intel-compute-runtime-legacy1}/etc/OpenCL/vendors";
  };
}
