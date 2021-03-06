; ModuleID = 'lua_upval.c'
target datalayout = "e-m:w-p:32:32-i64:64-f80:32-n8:16:32-S32"
target triple = "i686-pc-windows-gnu"

%struct.lua_State = type { %struct.GCObject*, i8, i8, i8, %struct.TValue*, %struct.global_State*, %struct.CallInfoLua*, i32*, %struct.TValue*, %struct.TValue*, %struct.UpVal*, %struct.GCObject*, %struct.lua_State*, %struct.lua_longjmp*, %struct.CallInfo, void (%struct.lua_State*, %struct.lua_Debug*)*, i64, i32, i32, i32, i16, i16, i8, i8 }
%struct.global_State = type opaque
%struct.CallInfoLua = type { %struct.TValue*, %struct.TValue*, %struct.CallInfo*, %struct.CallInfo*, %struct.CallInfoL, i64, i16, i8, i8 }
%struct.CallInfoL = type { %struct.TValue*, i32*, i64 }
%struct.UpVal = type { %struct.TValue*, i64, %union.anon.0 }
%union.anon.0 = type { %struct.TValue }
%struct.TValue = type { %union.Value, i32 }
%union.Value = type { i64 }
%struct.GCObject = type { %struct.GCObject*, i8, i8 }
%struct.lua_longjmp = type opaque
%struct.CallInfo = type { %struct.TValue*, %struct.TValue*, %struct.CallInfo*, %struct.CallInfo*, %union.anon, i64, i16, i8, i8 }
%union.anon = type { %struct.CallInfoC }
%struct.CallInfoC = type { i32 (%struct.lua_State*, i32, i64)*, i64, i64 }
%struct.lua_Debug = type opaque
%struct.LClosure = type { %struct.GCObject*, i8, i8, i8, %struct.GCObject*, %struct.Proto*, [1 x %struct.UpVal*] }
%struct.Proto = type { %struct.GCObject*, i8, i8, i8, i8, i8, i32, i32, i32, i32, i32, i32, i32, i32, %struct.TValue*, i32*, %struct.Proto**, i32*, %struct.LocVar*, %struct.Upvaldesc*, %struct.LClosure*, %struct.TString*, %struct.GCObject*, %struct.RaviJITProto }
%struct.LocVar = type { %struct.TString*, i32, i32, i32 }
%struct.Upvaldesc = type { %struct.TString*, i32, i8, i8 }
%struct.TString = type { %struct.GCObject*, i8, i8, i8, i32, i64, %struct.TString* }
%struct.RaviJITProto = type { i8, i8*, i32 (%struct.lua_State*)* }

; Function Attrs: nounwind
define void @luaV_op_call(%struct.lua_State* %L, %struct.LClosure* nocapture readonly %cl, %struct.TValue* nocapture readonly %ra, i32 %b, i32 %c) #0 {
entry:
  %arrayidx = getelementptr inbounds %struct.LClosure* %cl, i32 0, i32 6, i32 %b
  %0 = load %struct.UpVal** %arrayidx, align 4, !tbaa !1
  %tt_ = getelementptr inbounds %struct.TValue* %ra, i32 0, i32 1
  %1 = load i32* %tt_, align 4, !tbaa !5
  %v = getelementptr inbounds %struct.UpVal* %0, i32 0, i32 0
  %2 = load %struct.TValue** %v, align 4, !tbaa !8
  %tt_1 = getelementptr inbounds %struct.TValue* %2, i32 0, i32 1
  store i32 %1, i32* %tt_1, align 4, !tbaa !5
  %n = bitcast %struct.TValue* %ra to double*
  %3 = load double* %n, align 8, !tbaa !11
  %4 = bitcast %struct.UpVal* %0 to double**
  %5 = load double** %4, align 4, !tbaa !8
  store double %3, double* %5, align 8, !tbaa !11
  %6 = load %struct.TValue** %v, align 4, !tbaa !8
  %tt_6 = getelementptr inbounds %struct.TValue* %6, i32 0, i32 1
  %7 = load i32* %tt_6, align 4, !tbaa !5
  %and = and i32 %7, 64
  %value = getelementptr inbounds %struct.UpVal* %0, i32 0, i32 2, i32 0
  %tt_7 = getelementptr inbounds %struct.UpVal* %0, i32 0, i32 2, i32 0, i32 1
  store i32 1, i32* %tt_7, align 4, !tbaa !5
  %8 = load %struct.TValue** %v, align 4, !tbaa !8
  %cmp = icmp ne %struct.TValue* %8, %value
  %tobool = icmp eq i32 %and, 0
  %or.cond = or i1 %tobool, %cmp
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @luaC_upvalbarrier_(%struct.lua_State* %L, %struct.UpVal* %0) #2
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  ret void
}

declare void @luaC_upvalbarrier_(%struct.lua_State*, %struct.UpVal*) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.6.0 (trunk)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"any pointer", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !7, i64 8}
!6 = metadata !{metadata !"TValue", metadata !3, i64 0, metadata !7, i64 8}
!7 = metadata !{metadata !"int", metadata !3, i64 0}
!8 = metadata !{metadata !9, metadata !2, i64 0}
!9 = metadata !{metadata !"UpVal", metadata !2, i64 0, metadata !10, i64 8, metadata !3, i64 16}
!10 = metadata !{metadata !"long long", metadata !3, i64 0}
!11 = metadata !{metadata !12, metadata !12, i64 0}
!12 = metadata !{metadata !"double", metadata !3, i64 0}
