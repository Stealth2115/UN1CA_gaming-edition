# Apply t2s gaming-prop tuning to generated system build.prop
for FILE in "$WORK_DIR/system/system/build.prop" "$WORK_DIR/vendor/default.prop" "$WORK_DIR/vendor/build.prop"; do
    [ -f "$FILE" ] || continue

    for PROP in \
        "debug.hwui.renderer=vulkan" \
        "debug.hwui.use_vulkan=true" \
        "debug.hwui.skia.enabled=true" \
        "debug.hwui.profile=false" \
        "debug.atrace.tags.enable=0" \
        "debug.sf.disable_gl_composition=true" \
        "debug.sf.disable_hwc=1" \
        "debug.sf.disable_gl_backpressure=1" \
        "persist.sys.vulkan.multithread=true" \
        "persist.sys.vulkan.threaded=true" \
        "persist.sys.surface_flinger.hint_manager=true" \
        "persist.sys.fuse.passthrough.enable=true" \
        "dalvik.vm.dex2oat64.enabled=true" \
        "ro.hwui.use_vulkan=true"; do
            KEY="${PROP%%=*}"
            if ! grep -q "^${KEY}=" "$FILE" 2>/dev/null; then
                echo "$PROP" >> "$FILE"
            else
                sed -i "s#^${KEY}=.*#${PROP}#" "$FILE"
            fi
    done

done

if [ -f "$WORK_DIR/system/system/build.prop" ]; then
    sed -i "/^persist.sys.logd/d" "$WORK_DIR/system/system/build.prop"
    sed -i "/^ro.logd.kernel/d" "$WORK_DIR/system/system/build.prop"
    echo "persist.sys.logd=0" >> "$WORK_DIR/system/system/build.prop"
    echo "persist.sys.logd.kernel=false" >> "$WORK_DIR/system/system/build.prop"
    echo "persist.traced.enable=0" >> "$WORK_DIR/system/system/build.prop"
    echo "debug.atrace.tags.enable=0" >> "$WORK_DIR/system/system/build.prop"
fi

unset FILE PROP KEY
