; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@global_smem = external local_unnamed_addr addrspace(3) global [0 x i8], align 16

; Function Attrs: nofree norecurse nounwind
define amdgpu_kernel void @_w8a8_block_fp8_matmul(ptr addrspace(1) inreg nocapture readonly %0, ptr addrspace(1) inreg nocapture readonly %1, ptr addrspace(1) inreg nocapture writeonly %2, ptr addrspace(1) inreg nocapture readonly %3, ptr addrspace(1) inreg nocapture readonly %4, i32 inreg %5, i32 inreg %6, i32 inreg %7, i32 inreg %8, i32 inreg %9, i32 inreg %10, i32 inreg %11, i32 inreg %12, i32 inreg %13, ptr addrspace(1) inreg nocapture readnone %14) local_unnamed_addr #0 !dbg !4 {
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !dbg !7
  %17 = shl i32 %16, 4, !dbg !7
  %18 = and i32 %17, 112, !dbg !7
  %19 = zext nneg i32 %18 to i64, !dbg !8
  %20 = getelementptr i8, ptr addrspace(1) %0, i64 %19, !dbg !8
  %21 = add i32 %6, 127, !dbg !9
  %22 = icmp sgt i32 %21, 127, !dbg !13
  %23 = icmp slt i32 %18, %6, !dbg !14
  %24 = and i1 %23, %22, !dbg !13
  %25 = insertelement <16 x i1> poison, i1 %24, i64 0, !dbg !15
  %26 = shufflevector <16 x i1> %25, <16 x i1> poison, <16 x i32> zeroinitializer, !dbg !15
  %27 = tail call <16 x i8> @llvm.masked.load.v16i8.p1(ptr addrspace(1) %20, i32 16, <16 x i1> %26, <16 x i8> zeroinitializer), !dbg !15
  %28 = and i32 %16, 8, !dbg !16
  %29 = shl i32 %16, 3, !dbg !16
  %30 = and i32 %29, 120, !dbg !16
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.x(), !dbg !17
  %32 = add i32 %5, 15, !dbg !18
  %33 = sdiv i32 %32, 16, !dbg !20
  %34 = shl nsw i32 %33, 4, !dbg !21
  %.frozen = freeze i32 %34, !dbg !22
  %35 = sdiv i32 %31, %.frozen, !dbg !22
  %36 = mul i32 %35, %.frozen, !dbg !23
  %.decomposed = sub i32 %31, %36, !dbg !23
  %37 = shl i32 %35, 4, !dbg !24
  %38 = sub i32 1, %37, !dbg !25
  %39 = tail call i32 @llvm.smin.i32(i32 %38, i32 16), !dbg !26
  %40 = sdiv i32 %.decomposed, %39, !dbg !27
  %41 = shl i32 %40, 4, !dbg !28
  %42 = lshr i32 %16, 6, !dbg !29
  %43 = lshr i32 %16, 4, !dbg !29
  %44 = and i32 %43, 15, !dbg !29
  %45 = or disjoint i32 %41, %44, !dbg !30
  %46 = srem i32 %45, %5, !dbg !31
  %47 = mul i32 %46, %10, !dbg !32
  %48 = add i32 %47, %30, !dbg !33
  %49 = sext i32 %48 to i64, !dbg !34
  %50 = getelementptr i8, ptr addrspace(1) %1, i64 %49, !dbg !34
  %51 = icmp slt i32 %30, %6, !dbg !35
  %52 = and i1 %51, %22, !dbg !13
  %53 = insertelement <8 x i1> poison, i1 %52, i64 0, !dbg !36
  %54 = shufflevector <8 x i1> %53, <8 x i1> poison, <8 x i32> zeroinitializer, !dbg !36
  %55 = tail call <8 x i8> @llvm.masked.load.v8i8.p1(ptr addrspace(1) %50, i32 16, <8 x i1> %54, <8 x i8> zeroinitializer), !dbg !36
  %56 = lshr i32 %16, 2, !dbg !29
  %57 = and i32 %56, 12, !dbg !29
  %58 = or disjoint i32 %41, %57, !dbg !30
  %59 = srem i32 %58, %5, !dbg !31
  %60 = sdiv i32 %59, %7, !dbg !37
  %61 = mul i32 %60, %13, !dbg !38
  %62 = sext i32 %61 to i64, !dbg !39
  %63 = getelementptr float, ptr addrspace(1) %4, i64 %62, !dbg !39
  %64 = or disjoint i32 %18, %28, !dbg !15
  %and.ra86 = and i32 %16, 112, !dbg !15
  %65 = xor i32 %64, %and.ra86, !dbg !15
  %66 = shl i32 %16, 4, !dbg !15
  %67 = and i32 %66, 3968, !dbg !15
  %68 = or disjoint i32 %65, %67, !dbg !15
  %69 = getelementptr inbounds i8, ptr addrspace(3) @global_smem, i32 %68, !dbg !15
  %70 = shufflevector <16 x i8> %27, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !15
  store <8 x i8> %70, ptr addrspace(3) %69, align 8, !dbg !15
  %71 = or disjoint i32 %18, 8, !dbg !15
  %and.ra89 = and i32 %16, 120, !dbg !15
  %72 = xor i32 %71, %and.ra89, !dbg !15
  %73 = or disjoint i32 %72, %67, !dbg !15
  %74 = getelementptr inbounds i8, ptr addrspace(3) @global_smem, i32 %73, !dbg !15
  %75 = shufflevector <16 x i8> %27, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>, !dbg !15
  store <8 x i8> %75, ptr addrspace(3) %74, align 8, !dbg !15
  %76 = or disjoint i32 %67, 4096, !dbg !15
  %77 = or disjoint i32 %76, %65, !dbg !15
  %78 = getelementptr inbounds i8, ptr addrspace(3) @global_smem, i32 %77, !dbg !15
  store <8 x i8> %70, ptr addrspace(3) %78, align 8, !dbg !15
  %79 = or disjoint i32 %76, %72, !dbg !15
  %80 = getelementptr inbounds i8, ptr addrspace(3) @global_smem, i32 %79, !dbg !15
  store <8 x i8> %75, ptr addrspace(3) %80, align 8, !dbg !15
  %81 = lshr i32 %16, 1, !dbg !36
  %82 = xor i32 %81, %29, !dbg !36
  %83 = and i32 %82, 120, !dbg !36
  %84 = shl nuw nsw i32 %44, 7, !dbg !36
  %85 = or disjoint i32 %83, %84, !dbg !36
  %86 = getelementptr inbounds i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %85, !dbg !36
  store <8 x i8> %55, ptr addrspace(3) %86, align 8, !dbg !36
  %87 = icmp sgt i32 %21, 255, !dbg !13
  br i1 %87, label %.lr.ph, label %._crit_edge, !dbg !13

.lr.ph:                                           ; preds = %15
  %88 = lshr i32 %21, 7, !dbg !40
  %89 = shl nuw nsw i32 %42, 4
  %90 = and i32 %89, 48
  %91 = and i32 %16, 15
  %92 = and i32 %81, 24
  %93 = or disjoint i32 %90, %91
  %94 = or disjoint i32 %92, 32
  %95 = or disjoint i32 %92, 64
  %96 = or disjoint i32 %92, 96
  %97 = shl nuw nsw i32 %91, 3
  %98 = xor i32 %92, %97
  %99 = shl nuw nsw i32 %93, 7
  %100 = or disjoint i32 %99, %98
  %101 = xor i32 %94, %97
  %102 = or disjoint i32 %99, %101
  %103 = xor i32 %95, %97
  %104 = or disjoint i32 %99, %103
  %105 = xor i32 %96, %97
  %106 = or disjoint i32 %99, %105
  %107 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %100
  %108 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %102
  %109 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %104
  %110 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %106
  %111 = shl nuw nsw i32 %91, 7
  %112 = or disjoint i32 %98, %111
  %113 = or disjoint i32 %101, %111
  %114 = or disjoint i32 %103, %111
  %115 = or disjoint i32 %105, %111
  %116 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %112
  %117 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %113
  %118 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %114
  %119 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %115
  %120 = add nsw i32 %88, -2
  br label %121, !dbg !13

121:                                              ; preds = %.lr.ph, %121
  %122 = phi i32 [ 0, %.lr.ph ], [ %128, %121 ]
  %.pn8093 = phi ptr addrspace(1) [ %50, %.lr.ph ], [ %134, %121 ]
  %.pn3292 = phi ptr addrspace(1) [ %20, %.lr.ph ], [ %126, %121 ]
  %123 = phi i32 [ 0, %.lr.ph ], [ %127, %121 ]
  %124 = phi <2 x float> [ zeroinitializer, %.lr.ph ], [ %165, %121 ]
  %125 = phi <2 x float> [ zeroinitializer, %.lr.ph ], [ %166, %121 ]
  %126 = getelementptr i8, ptr addrspace(1) %.pn3292, i64 128, !dbg !41
  %127 = add nuw nsw i32 %123, 1, !dbg !13
  %128 = shl i32 %127, 7, !dbg !42
  %129 = sub i32 %6, %128, !dbg !43
  %130 = icmp slt i32 %18, %129, !dbg !14
  %131 = insertelement <16 x i1> poison, i1 %130, i64 0, !dbg !15
  %132 = shufflevector <16 x i1> %131, <16 x i1> poison, <16 x i32> zeroinitializer, !dbg !15
  %133 = tail call <16 x i8> @llvm.masked.load.v16i8.p1(ptr addrspace(1) %126, i32 16, <16 x i1> %132, <16 x i8> zeroinitializer), !dbg !15
  %134 = getelementptr i8, ptr addrspace(1) %.pn8093, i64 128, !dbg !44
  %135 = icmp slt i32 %30, %129, !dbg !35
  %136 = insertelement <8 x i1> poison, i1 %135, i64 0, !dbg !36
  %137 = shufflevector <8 x i1> %136, <8 x i1> poison, <8 x i32> zeroinitializer, !dbg !36
  %138 = tail call <8 x i8> @llvm.masked.load.v8i8.p1(ptr addrspace(1) %134, i32 16, <8 x i1> %137, <8 x i8> zeroinitializer), !dbg !36
  %139 = sdiv i32 %122, %8, !dbg !45
  %140 = sext i32 %139 to i64, !dbg !46
  %141 = getelementptr float, ptr addrspace(1) %3, i64 %140, !dbg !46
  %unmaskedload = load <1 x float>, ptr addrspace(1) %141, align 4, !dbg !47
  %142 = getelementptr float, ptr addrspace(1) %63, i64 %140, !dbg !48
  %unmaskedload84 = load <1 x float>, ptr addrspace(1) %142, align 4, !dbg !49
  fence syncscope("workgroup") release, !dbg !15
  tail call void @llvm.amdgcn.s.barrier(), !dbg !15
  fence syncscope("workgroup") acquire, !dbg !15
  %143 = load i64, ptr addrspace(3) %107, align 8, !dbg !15
  %144 = load i64, ptr addrspace(3) %108, align 8, !dbg !15
  %145 = load i64, ptr addrspace(3) %109, align 8, !dbg !15
  %146 = load i64, ptr addrspace(3) %110, align 8, !dbg !15
  %147 = load i64, ptr addrspace(3) %116, align 8, !dbg !36
  %148 = load i64, ptr addrspace(3) %117, align 8, !dbg !36
  %149 = load i64, ptr addrspace(3) %118, align 8, !dbg !36
  %150 = load i64, ptr addrspace(3) %119, align 8, !dbg !36
  %151 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %147, i64 %143, <4 x float> zeroinitializer, i32 0, i32 0, i32 0), !dbg !50
  %152 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %148, i64 %144, <4 x float> %151, i32 0, i32 0, i32 0), !dbg !50
  %153 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %149, i64 %145, <4 x float> %152, i32 0, i32 0, i32 0), !dbg !50
  %154 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %150, i64 %146, <4 x float> %153, i32 0, i32 0, i32 0), !dbg !50
  fence syncscope("workgroup") release, !dbg !15
  tail call void @llvm.amdgcn.s.barrier(), !dbg !15
  fence syncscope("workgroup") acquire, !dbg !15
  %155 = shufflevector <16 x i8> %133, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !15
  store <8 x i8> %155, ptr addrspace(3) %69, align 8, !dbg !15
  %156 = shufflevector <16 x i8> %133, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>, !dbg !15
  store <8 x i8> %156, ptr addrspace(3) %74, align 8, !dbg !15
  store <8 x i8> %155, ptr addrspace(3) %78, align 8, !dbg !15
  store <8 x i8> %156, ptr addrspace(3) %80, align 8, !dbg !15
  store <8 x i8> %138, ptr addrspace(3) %86, align 8, !dbg !36
  %157 = shufflevector <1 x float> %unmaskedload, <1 x float> poison, <2 x i32> zeroinitializer, !dbg !51
  %158 = shufflevector <4 x float> %154, <4 x float> poison, <2 x i32> <i32 0, i32 1>, !dbg !51
  %159 = fmul <2 x float> %157, %158, !dbg !51
  %160 = shufflevector <1 x float> %unmaskedload84, <1 x float> poison, <2 x i32> zeroinitializer, !dbg !52
  %161 = fmul <2 x float> %160, %159, !dbg !52
  %162 = shufflevector <4 x float> %154, <4 x float> poison, <2 x i32> <i32 2, i32 3>, !dbg !51
  %163 = fmul <2 x float> %157, %162, !dbg !51
  %164 = fmul <2 x float> %160, %163, !dbg !52
  %165 = fadd <2 x float> %124, %161, !dbg !53
  %166 = fadd <2 x float> %125, %164, !dbg !53
  %exitcond.not = icmp eq i32 %123, %120, !dbg !13
  br i1 %exitcond.not, label %._crit_edge, label %121, !dbg !13

._crit_edge:                                      ; preds = %121, %15
  %.lcssa = phi i32 [ 0, %15 ], [ %128, %121 ], !dbg !42
  %167 = phi <2 x float> [ zeroinitializer, %15 ], [ %165, %121 ]
  %168 = phi <2 x float> [ zeroinitializer, %15 ], [ %166, %121 ]
  fence syncscope("workgroup") release, !dbg !15
  tail call void @llvm.amdgcn.s.barrier(), !dbg !15
  fence syncscope("workgroup") acquire, !dbg !15
  br i1 %22, label %169, label %._crit_edge._crit_edge, !dbg !50

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %.pre = and i32 %16, 15, !dbg !54
  br label %217, !dbg !50

169:                                              ; preds = %._crit_edge
  %170 = and i32 %81, 24, !dbg !15
  %171 = or disjoint i32 %170, 96, !dbg !15
  %172 = and i32 %16, 15, !dbg !15
  %173 = shl nuw nsw i32 %172, 3, !dbg !36
  %174 = xor i32 %171, %173, !dbg !36
  %175 = shl nuw nsw i32 %172, 7, !dbg !36
  %176 = or disjoint i32 %174, %175, !dbg !36
  %177 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %176, !dbg !36
  %178 = load i64, ptr addrspace(3) %177, align 8, !dbg !36
  %179 = or disjoint i32 %170, 64, !dbg !15
  %180 = xor i32 %179, %173, !dbg !36
  %181 = or disjoint i32 %180, %175, !dbg !36
  %182 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %181, !dbg !36
  %183 = load i64, ptr addrspace(3) %182, align 8, !dbg !36
  %184 = or disjoint i32 %170, 32, !dbg !15
  %185 = xor i32 %184, %173, !dbg !36
  %186 = or disjoint i32 %185, %175, !dbg !36
  %187 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %186, !dbg !36
  %188 = load i64, ptr addrspace(3) %187, align 8, !dbg !36
  %189 = xor i32 %170, %173, !dbg !36
  %190 = or disjoint i32 %189, %175, !dbg !36
  %191 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %190, !dbg !36
  %192 = load i64, ptr addrspace(3) %191, align 8, !dbg !36
  %193 = shl nuw nsw i32 %42, 4, !dbg !15
  %194 = and i32 %193, 48, !dbg !15
  %195 = or disjoint i32 %194, %172, !dbg !15
  %196 = shl nuw nsw i32 %195, 7, !dbg !15
  %197 = or disjoint i32 %196, %174, !dbg !15
  %198 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %197, !dbg !15
  %199 = load i64, ptr addrspace(3) %198, align 8, !dbg !15
  %200 = or disjoint i32 %196, %180, !dbg !15
  %201 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %200, !dbg !15
  %202 = load i64, ptr addrspace(3) %201, align 8, !dbg !15
  %203 = or disjoint i32 %196, %185, !dbg !15
  %204 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %203, !dbg !15
  %205 = load i64, ptr addrspace(3) %204, align 8, !dbg !15
  %206 = or disjoint i32 %196, %189, !dbg !15
  %207 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %206, !dbg !15
  %208 = load i64, ptr addrspace(3) %207, align 8, !dbg !15
  %209 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %192, i64 %208, <4 x float> zeroinitializer, i32 0, i32 0, i32 0), !dbg !50
  %210 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %188, i64 %205, <4 x float> %209, i32 0, i32 0, i32 0), !dbg !50
  %211 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %183, i64 %202, <4 x float> %210, i32 0, i32 0, i32 0), !dbg !50
  %212 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %178, i64 %199, <4 x float> %211, i32 0, i32 0, i32 0), !dbg !50
  %213 = extractelement <4 x float> %212, i64 0, !dbg !50
  %214 = extractelement <4 x float> %212, i64 1, !dbg !50
  %215 = extractelement <4 x float> %212, i64 2, !dbg !50
  %216 = extractelement <4 x float> %212, i64 3, !dbg !50
  br label %217, !dbg !50

217:                                              ; preds = %._crit_edge._crit_edge, %169
  %.pre-phi = phi i32 [ %.pre, %._crit_edge._crit_edge ], [ %172, %169 ], !dbg !54
  %218 = phi float [ 0.000000e+00, %._crit_edge._crit_edge ], [ %213, %169 ], !dbg !50
  %219 = phi float [ 0.000000e+00, %._crit_edge._crit_edge ], [ %214, %169 ], !dbg !50
  %220 = phi float [ 0.000000e+00, %._crit_edge._crit_edge ], [ %215, %169 ], !dbg !50
  %221 = phi float [ 0.000000e+00, %._crit_edge._crit_edge ], [ %216, %169 ], !dbg !50
  %222 = srem i32 %31, %39, !dbg !55
  %223 = add i32 %222, %37, !dbg !56
  %224 = sdiv i32 %.lcssa, %8, !dbg !45
  %225 = sext i32 %224 to i64, !dbg !46
  %226 = getelementptr float, ptr addrspace(1) %3, i64 %225, !dbg !46
  %227 = insertelement <1 x i1> poison, i1 %22, i64 0, !dbg !47
  %228 = tail call <1 x float> @llvm.masked.load.v1f32.p1(ptr addrspace(1) %226, i32 4, <1 x i1> %227, <1 x float> zeroinitializer), !dbg !47
  %229 = extractelement <1 x float> %228, i64 0, !dbg !47
  %230 = getelementptr float, ptr addrspace(1) %63, i64 %225, !dbg !48
  %231 = tail call <1 x float> @llvm.masked.load.v1f32.p1(ptr addrspace(1) %230, i32 4, <1 x i1> %227, <1 x float> zeroinitializer), !dbg !49
  %232 = extractelement <1 x float> %231, i64 0, !dbg !49
  %233 = fmul float %218, %229, !dbg !51
  %234 = fmul float %219, %229, !dbg !51
  %235 = fmul float %220, %229, !dbg !51
  %236 = fmul float %221, %229, !dbg !51
  %237 = fmul float %233, %232, !dbg !52
  %238 = fmul float %234, %232, !dbg !52
  %239 = fmul float %235, %232, !dbg !52
  %240 = fmul float %236, %232, !dbg !52
  %241 = extractelement <2 x float> %167, i64 0, !dbg !53
  %242 = fadd float %241, %237, !dbg !53
  %243 = extractelement <2 x float> %167, i64 1, !dbg !53
  %244 = fadd float %243, %238, !dbg !53
  %245 = extractelement <2 x float> %168, i64 0, !dbg !53
  %246 = fadd float %245, %239, !dbg !53
  %247 = extractelement <2 x float> %168, i64 1, !dbg !53
  %248 = fadd float %247, %240, !dbg !53
  %249 = select i1 %22, float %242, float %241, !dbg !13
  %250 = select i1 %22, float %244, float %243, !dbg !13
  %251 = select i1 %22, float %246, float %245, !dbg !13
  %252 = select i1 %22, float %248, float %247, !dbg !13
  %253 = bitcast float %249 to i32, !dbg !57
  %254 = and i32 %253, 2139095040, !dbg !57
  %.not = icmp eq i32 %254, 2139095040, !dbg !57
  %255 = lshr i32 %253, 16, !dbg !57
  %256 = and i32 %255, 1, !dbg !57
  %257 = add nuw nsw i32 %256, 32767, !dbg !57
  %258 = select i1 %.not, i32 0, i32 %257, !dbg !57
  %259 = add i32 %258, %253, !dbg !57
  %260 = and i32 %253, 65535, !dbg !57
  %261 = icmp ne i32 %260, 0, !dbg !57
  %262 = and i1 %.not, %261, !dbg !57
  %263 = or i32 %253, 65536, !dbg !57
  %264 = select i1 %262, i32 %263, i32 %259, !dbg !57
  %265 = lshr i32 %264, 16, !dbg !57
  %266 = trunc nuw i32 %265 to i16, !dbg !57
  %267 = bitcast float %250 to i32, !dbg !57
  %268 = and i32 %267, 2139095040, !dbg !57
  %.not81 = icmp eq i32 %268, 2139095040, !dbg !57
  %269 = lshr i32 %267, 16, !dbg !57
  %270 = and i32 %269, 1, !dbg !57
  %271 = add nuw nsw i32 %270, 32767, !dbg !57
  %272 = select i1 %.not81, i32 0, i32 %271, !dbg !57
  %273 = add i32 %272, %267, !dbg !57
  %274 = and i32 %267, 65535, !dbg !57
  %275 = icmp ne i32 %274, 0, !dbg !57
  %276 = and i1 %.not81, %275, !dbg !57
  %277 = or i32 %267, 65536, !dbg !57
  %278 = select i1 %276, i32 %277, i32 %273, !dbg !57
  %279 = lshr i32 %278, 16, !dbg !57
  %280 = trunc nuw i32 %279 to i16, !dbg !57
  %281 = bitcast float %251 to i32, !dbg !57
  %282 = and i32 %281, 2139095040, !dbg !57
  %.not82 = icmp eq i32 %282, 2139095040, !dbg !57
  %283 = lshr i32 %281, 16, !dbg !57
  %284 = and i32 %283, 1, !dbg !57
  %285 = add nuw nsw i32 %284, 32767, !dbg !57
  %286 = select i1 %.not82, i32 0, i32 %285, !dbg !57
  %287 = add i32 %286, %281, !dbg !57
  %288 = and i32 %281, 65535, !dbg !57
  %289 = icmp ne i32 %288, 0, !dbg !57
  %290 = and i1 %.not82, %289, !dbg !57
  %291 = or i32 %281, 65536, !dbg !57
  %292 = select i1 %290, i32 %291, i32 %287, !dbg !57
  %293 = lshr i32 %292, 16, !dbg !57
  %294 = trunc nuw i32 %293 to i16, !dbg !57
  %295 = bitcast float %252 to i32, !dbg !57
  %296 = and i32 %295, 2139095040, !dbg !57
  %.not83 = icmp eq i32 %296, 2139095040, !dbg !57
  %297 = lshr i32 %295, 16, !dbg !57
  %298 = and i32 %297, 1, !dbg !57
  %299 = add nuw nsw i32 %298, 32767, !dbg !57
  %300 = select i1 %.not83, i32 0, i32 %299, !dbg !57
  %301 = add i32 %300, %295, !dbg !57
  %302 = and i32 %295, 65535, !dbg !57
  %303 = icmp ne i32 %302, 0, !dbg !57
  %304 = and i1 %.not83, %303, !dbg !57
  %305 = or i32 %295, 65536, !dbg !57
  %306 = select i1 %304, i32 %305, i32 %301, !dbg !57
  %307 = lshr i32 %306, 16, !dbg !57
  %308 = trunc nuw i32 %307 to i16, !dbg !57
  %309 = shl i32 %223, 6, !dbg !58
  %310 = and i32 %56, 16, !dbg !54
  %311 = or disjoint i32 %310, %.pre-phi, !dbg !54
  %312 = lshr i32 %16, 2, !dbg !54
  %313 = and i32 %312, 32, !dbg !54
  %314 = or disjoint i32 %311, %313, !dbg !54
  %315 = or disjoint i32 %309, %314, !dbg !59
  %316 = mul i32 %315, %11, !dbg !60
  %317 = sext i32 %316 to i64, !dbg !61
  %318 = getelementptr bfloat, ptr addrspace(1) %2, i64 %317, !dbg !61
  %319 = sext i32 %58 to i64, !dbg !62
  %320 = getelementptr bfloat, ptr addrspace(1) %318, i64 %319, !dbg !62
  %321 = icmp slt i32 %315, 1, !dbg !63
  %322 = icmp slt i32 %58, %5, !dbg !64
  %323 = and i1 %322, %321, !dbg !65
  %324 = insertelement <4 x i16> poison, i16 %266, i64 0, !dbg !66
  %325 = insertelement <4 x i16> %324, i16 %280, i64 1, !dbg !66
  %326 = insertelement <4 x i16> %325, i16 %294, i64 2, !dbg !66
  %327 = insertelement <4 x i16> %326, i16 %308, i64 3, !dbg !66
  %328 = bitcast <4 x i16> %327 to <4 x bfloat>, !dbg !66
  %329 = insertelement <4 x i1> poison, i1 %323, i64 0, !dbg !66
  %330 = shufflevector <4 x i1> %329, <4 x i1> poison, <4 x i32> zeroinitializer, !dbg !66
  tail call void @llvm.masked.store.v4bf16.p1(<4 x bfloat> %328, ptr addrspace(1) %320, i32 16, <4 x i1> %330), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <16 x i8> @llvm.masked.load.v16i8.p1(ptr addrspace(1) nocapture, i32 immarg, <16 x i1>, <16 x i8>) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <8 x i8> @llvm.masked.load.v8i8.p1(ptr addrspace(1) nocapture, i32 immarg, <8 x i1>, <8 x i8>) #2

; Function Attrs: convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #3

; Function Attrs: convergent mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64, i64, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <1 x float> @llvm.masked.load.v1f32.p1(ptr addrspace(1) nocapture, i32 immarg, <1 x i1>, <1 x float>) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v4bf16.p1(<4 x bfloat>, ptr addrspace(1) nocapture, i32 immarg, <4 x i1>) #5

attributes #0 = { nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "amdgpu-no-agpr" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-waves-per-eu"="0" "denormal-fp-math-f32"="ieee" "uniform-work-group-size"="false" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #3 = { convergent mustprogress nocallback nofree nounwind willreturn }
attributes #4 = { convergent mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 400}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "triton", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly)
!3 = !DIFile(filename: "fp8_kernel.py", directory: "/sgl-workspace/sglang/python/sglang/srt/layers/quantization")
!4 = distinct !DISubprogram(name: "_w8a8_block_fp8_matmul", linkageName: "_w8a8_block_fp8_matmul", scope: !3, file: !3, line: 173, type: !5, scopeLine: 173, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!5 = !DISubroutineType(cc: DW_CC_normal, types: !6)
!6 = !{}
!7 = !DILocation(line: 222, column: 56, scope: !4)
!8 = !DILocation(line: 222, column: 18, scope: !4)
!9 = !DILocation(line: 40, column: 22, scope: !10, inlinedAt: !12)
!10 = distinct !DILexicalBlockFile(scope: !4, file: !11, discriminator: 0)
!11 = !DIFile(filename: "standard.py", directory: "/usr/local/lib/python3.12/dist-packages/triton/language")
!12 = !DILocation(line: 230, column: 33, scope: !4)
!13 = !DILocation(line: 230, column: 22, scope: !4)
!14 = !DILocation(line: 231, column: 51, scope: !4)
!15 = !DILocation(line: 231, column: 20, scope: !4)
!16 = !DILocation(line: 223, column: 25, scope: !4)
!17 = !DILocation(line: 209, column: 24, scope: !4)
!18 = !DILocation(line: 40, column: 22, scope: !10, inlinedAt: !19)
!19 = !DILocation(line: 211, column: 27, scope: !4)
!20 = !DILocation(line: 40, column: 28, scope: !10, inlinedAt: !19)
!21 = !DILocation(line: 212, column: 38, scope: !4)
!22 = !DILocation(line: 213, column: 22, scope: !4)
!23 = !DILocation(line: 217, column: 19, scope: !4)
!24 = !DILocation(line: 214, column: 29, scope: !4)
!25 = !DILocation(line: 215, column: 35, scope: !4)
!26 = !DILocation(line: 215, column: 48, scope: !4)
!27 = !DILocation(line: 217, column: 40, scope: !4)
!28 = !DILocation(line: 220, column: 23, scope: !4)
!29 = !DILocation(line: 220, column: 51, scope: !4)
!30 = !DILocation(line: 220, column: 38, scope: !4)
!31 = !DILocation(line: 220, column: 68, scope: !4)
!32 = !DILocation(line: 223, column: 67, scope: !4)
!33 = !DILocation(line: 223, column: 48, scope: !4)
!34 = !DILocation(line: 223, column: 18, scope: !4)
!35 = !DILocation(line: 232, column: 51, scope: !4)
!36 = !DILocation(line: 232, column: 20, scope: !4)
!37 = !DILocation(line: 226, column: 26, scope: !4)
!38 = !DILocation(line: 227, column: 30, scope: !4)
!39 = !DILocation(line: 227, column: 19, scope: !4)
!40 = !DILocation(line: 40, column: 28, scope: !10, inlinedAt: !12)
!41 = !DILocation(line: 240, column: 18, scope: !4)
!42 = !DILocation(line: 231, column: 59, scope: !4)
!43 = !DILocation(line: 231, column: 55, scope: !4)
!44 = !DILocation(line: 241, column: 18, scope: !4)
!45 = !DILocation(line: 235, column: 29, scope: !4)
!46 = !DILocation(line: 236, column: 32, scope: !4)
!47 = !DILocation(line: 236, column: 22, scope: !4)
!48 = !DILocation(line: 237, column: 32, scope: !4)
!49 = !DILocation(line: 237, column: 22, scope: !4)
!50 = !DILocation(line: 239, column: 33, scope: !4)
!51 = !DILocation(line: 239, column: 38, scope: !4)
!52 = !DILocation(line: 239, column: 53, scope: !4)
!53 = !DILocation(line: 239, column: 23, scope: !4)
!54 = !DILocation(line: 250, column: 50, scope: !4)
!55 = !DILocation(line: 216, column: 33, scope: !4)
!56 = !DILocation(line: 216, column: 27, scope: !4)
!57 = !DILocation(line: 244, column: 27, scope: !4)
!58 = !DILocation(line: 250, column: 22, scope: !4)
!59 = !DILocation(line: 250, column: 37, scope: !4)
!60 = !DILocation(line: 252, column: 29, scope: !4)
!61 = !DILocation(line: 252, column: 17, scope: !4)
!62 = !DILocation(line: 252, column: 48, scope: !4)
!63 = !DILocation(line: 253, column: 33, scope: !4)
!64 = !DILocation(line: 253, column: 58, scope: !4)
!65 = !DILocation(line: 253, column: 39, scope: !4)
!66 = !DILocation(line: 254, column: 21, scope: !4)
!67 = !DILocation(line: 254, column: 4, scope: !4)
