# This file is generated by gyp; do not edit.

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := GYP
LOCAL_MODULE := third_party_WebKit_Source_bindings_modules_modules_event_generated_gyp
LOCAL_MODULE_STEM := modules_event_generated
LOCAL_MODULE_SUFFIX := .stamp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_TARGET_ARCH := $(TARGET_$(GYP_VAR_PREFIX)ARCH)
gyp_intermediate_dir := $(call local-intermediates-dir,,$(GYP_VAR_PREFIX))
gyp_shared_intermediate_dir := $(call intermediates-dir-for,GYP,shared,,,$(GYP_VAR_PREFIX))

# Make sure our deps are built first.
GYP_TARGET_DEPENDENCIES :=

### Rules for action "event_interfaces":
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in: $(LOCAL_PATH)/third_party/WebKit/Source/bindings/scripts/generate_event_interfaces.py $(LOCAL_PATH)/third_party/WebKit/Source/bindings/scripts/utilities.py $(LOCAL_PATH)/third_party/WebKit/Source/bindings/modules/event_idl_files_list.tmp $(LOCAL_PATH)/third_party/WebKit/Source/modules/device_light/DeviceLightEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/device_orientation/DeviceMotionEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/device_orientation/DeviceOrientationEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/encryptedmedia/MediaKeyMessageEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/encryptedmedia/MediaKeyNeededEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/gamepad/GamepadEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/indexeddb/IDBVersionChangeEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/mediastream/MediaStreamEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/mediastream/MediaStreamTrackEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/mediastream/RTCDTMFToneChangeEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/mediastream/RTCDataChannelEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/mediastream/RTCIceCandidateEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/push_messaging/PushEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/serviceworkers/FetchEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/serviceworkers/InstallEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/serviceworkers/InstallPhaseEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/speech/SpeechRecognitionError.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/speech/SpeechRecognitionEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/speech/SpeechSynthesisEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/webaudio/AudioProcessingEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/webaudio/OfflineAudioCompletionEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/webmidi/MIDIConnectionEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/webmidi/MIDIMessageEvent.idl $(LOCAL_PATH)/third_party/WebKit/Source/modules/websockets/CloseEvent.idl $(GYP_TARGET_DEPENDENCIES)
	@echo "Gyp action: third_party_WebKit_Source_bindings_modules_generated_gyp_modules_event_generated_target_event_interfaces ($@)"
	$(hide)cd $(gyp_local_path)/third_party/WebKit/Source/bindings/modules; mkdir -p $(gyp_shared_intermediate_dir)/blink/modules; python ../scripts/generate_event_interfaces.py --event-idl-files-list event_idl_files_list.tmp --event-interfaces-file "$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in" --write-file-only-if-changed 0 --suffix Modules


### Rules for action "EventModulesFactory":
$(gyp_shared_intermediate_dir)/blink/modules/EventModules.cpp: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/blink/modules/EventModules.cpp: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/blink/modules/EventModules.cpp: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventModules.cpp: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventModules.cpp: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/blink/modules/EventModules.cpp: $(LOCAL_PATH)/third_party/jinja2/__init__.py $(LOCAL_PATH)/third_party/markupsafe/__init__.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/hasher.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/in_file.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/in_generator.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/license.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/name_macros.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/name_utilities.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/template_expander.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/macros.tmpl $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/make_event_factory.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/EventFactory.cpp.tmpl $(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in $(GYP_TARGET_DEPENDENCIES)
	@echo "Gyp action: third_party_WebKit_Source_bindings_modules_generated_gyp_modules_event_generated_target_EventModulesFactory ($@)"
	$(hide)cd $(gyp_local_path)/third_party/WebKit/Source/bindings/modules; mkdir -p $(gyp_shared_intermediate_dir)/blink/modules; python ../../build/scripts/make_event_factory.py "$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in" --output_dir "$(gyp_shared_intermediate_dir)/blink/modules"

$(gyp_shared_intermediate_dir)/blink/modules/EventModulesHeaders.h: $(gyp_shared_intermediate_dir)/blink/modules/EventModules.cpp ;
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.h: $(gyp_shared_intermediate_dir)/blink/modules/EventModules.cpp ;

### Rules for action "EventModulesNames":
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.cpp: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.cpp: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.cpp: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.cpp: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.cpp: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.cpp: $(LOCAL_PATH)/third_party/jinja2/__init__.py $(LOCAL_PATH)/third_party/markupsafe/__init__.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/hasher.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/in_file.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/in_generator.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/license.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/name_macros.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/name_utilities.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/template_expander.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/macros.tmpl $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/make_names.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/MakeNames.cpp.tmpl $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/MakeNames.h.tmpl $(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in $(GYP_TARGET_DEPENDENCIES)
	@echo "Gyp action: third_party_WebKit_Source_bindings_modules_generated_gyp_modules_event_generated_target_EventModulesNames ($@)"
	$(hide)cd $(gyp_local_path)/third_party/WebKit/Source/bindings/modules; mkdir -p $(gyp_shared_intermediate_dir)/blink/modules; python ../../build/scripts/make_names.py "$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in" --output_dir "$(gyp_shared_intermediate_dir)/blink/modules"

$(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.h: $(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.cpp ;

### Rules for action "EventTargetModulesFactory":
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesHeaders.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesHeaders.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesHeaders.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesHeaders.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesHeaders.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesHeaders.h: $(LOCAL_PATH)/third_party/jinja2/__init__.py $(LOCAL_PATH)/third_party/markupsafe/__init__.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/hasher.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/in_file.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/in_generator.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/license.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/name_macros.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/name_utilities.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/template_expander.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/macros.tmpl $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/make_event_factory.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/EventFactory.cpp.tmpl $(LOCAL_PATH)/third_party/WebKit/Source/modules/EventTargetModulesFactory.in $(GYP_TARGET_DEPENDENCIES)
	@echo "Gyp action: third_party_WebKit_Source_bindings_modules_generated_gyp_modules_event_generated_target_EventTargetModulesFactory ($@)"
	$(hide)cd $(gyp_local_path)/third_party/WebKit/Source/bindings/modules; mkdir -p $(gyp_shared_intermediate_dir)/blink/modules; python ../../build/scripts/make_event_factory.py ../../modules/EventTargetModulesFactory.in --output_dir "$(gyp_shared_intermediate_dir)/blink/modules"

$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesInterfaces.h: $(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesHeaders.h ;

### Rules for action "EventTargetModulesNames":
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.cpp: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.cpp: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.cpp: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.cpp: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.cpp: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.cpp: $(LOCAL_PATH)/third_party/jinja2/__init__.py $(LOCAL_PATH)/third_party/markupsafe/__init__.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/hasher.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/in_file.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/in_generator.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/license.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/name_macros.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/name_utilities.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/template_expander.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/macros.tmpl $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/make_names.py $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/MakeNames.cpp.tmpl $(LOCAL_PATH)/third_party/WebKit/Source/build/scripts/templates/MakeNames.h.tmpl $(LOCAL_PATH)/third_party/WebKit/Source/modules/EventTargetModulesFactory.in $(GYP_TARGET_DEPENDENCIES)
	@echo "Gyp action: third_party_WebKit_Source_bindings_modules_generated_gyp_modules_event_generated_target_EventTargetModulesNames ($@)"
	$(hide)cd $(gyp_local_path)/third_party/WebKit/Source/bindings/modules; mkdir -p $(gyp_shared_intermediate_dir)/blink/modules; python ../../build/scripts/make_names.py ../../modules/EventTargetModulesFactory.in --output_dir "$(gyp_shared_intermediate_dir)/blink/modules"

$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.h: $(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.cpp ;


GYP_GENERATED_OUTPUTS := \
	$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.in \
	$(gyp_shared_intermediate_dir)/blink/modules/EventModules.cpp \
	$(gyp_shared_intermediate_dir)/blink/modules/EventModulesHeaders.h \
	$(gyp_shared_intermediate_dir)/blink/modules/EventModulesInterfaces.h \
	$(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.cpp \
	$(gyp_shared_intermediate_dir)/blink/modules/EventModulesNames.h \
	$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesHeaders.h \
	$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesInterfaces.h \
	$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.cpp \
	$(gyp_shared_intermediate_dir)/blink/modules/EventTargetModulesNames.h

# Make sure our deps and generated files are built first.
LOCAL_ADDITIONAL_DEPENDENCIES := $(GYP_TARGET_DEPENDENCIES) $(GYP_GENERATED_OUTPUTS)

### Rules for final target.
# Add target alias to "gyp_all_modules" target.
.PHONY: gyp_all_modules
gyp_all_modules: third_party_WebKit_Source_bindings_modules_modules_event_generated_gyp

# Alias gyp target name.
.PHONY: modules_event_generated
modules_event_generated: third_party_WebKit_Source_bindings_modules_modules_event_generated_gyp

LOCAL_MODULE_PATH := $(PRODUCT_OUT)/gyp_stamp
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_2ND_ARCH_VAR_PREFIX := $(GYP_VAR_PREFIX)

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(LOCAL_ADDITIONAL_DEPENDENCIES)
	$(hide) echo "Gyp timestamp: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) touch $@

LOCAL_2ND_ARCH_VAR_PREFIX :=
