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
  %56 = insertelement <1 x i1> poison, i1 %22, i64 0, !dbg !37
  %57 = tail call <1 x float> @llvm.masked.load.v1f32.p1(ptr addrspace(1) %3, i32 4, <1 x i1> %56, <1 x float> zeroinitializer), !dbg !37
  %58 = extractelement <1 x float> %57, i64 0, !dbg !37
  %59 = lshr i32 %16, 2, !dbg !29
  %60 = and i32 %59, 12, !dbg !29
  %61 = or disjoint i32 %41, %60, !dbg !30
  %62 = srem i32 %61, %5, !dbg !31
  %63 = sdiv i32 %62, %7, !dbg !38
  %64 = mul i32 %63, %13, !dbg !39
  %65 = sext i32 %64 to i64, !dbg !40
  %66 = getelementptr float, ptr addrspace(1) %4, i64 %65, !dbg !40
  %67 = tail call <1 x float> @llvm.masked.load.v1f32.p1(ptr addrspace(1) %66, i32 4, <1 x i1> %56, <1 x float> zeroinitializer), !dbg !41
  %68 = extractelement <1 x float> %67, i64 0, !dbg !41
  %69 = or disjoint i32 %18, %28, !dbg !15
  %and.ra96 = and i32 %16, 112, !dbg !15
  %70 = xor i32 %69, %and.ra96, !dbg !15
  %71 = shl i32 %16, 4, !dbg !15
  %72 = and i32 %71, 3968, !dbg !15
  %73 = or disjoint i32 %70, %72, !dbg !15
  %74 = getelementptr inbounds i8, ptr addrspace(3) @global_smem, i32 %73, !dbg !15
  %75 = shufflevector <16 x i8> %27, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !15
  store <8 x i8> %75, ptr addrspace(3) %74, align 8, !dbg !15
  %76 = or disjoint i32 %18, 8, !dbg !15
  %and.ra99 = and i32 %16, 120, !dbg !15
  %77 = xor i32 %76, %and.ra99, !dbg !15
  %78 = or disjoint i32 %77, %72, !dbg !15
  %79 = getelementptr inbounds i8, ptr addrspace(3) @global_smem, i32 %78, !dbg !15
  %80 = shufflevector <16 x i8> %27, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>, !dbg !15
  store <8 x i8> %80, ptr addrspace(3) %79, align 8, !dbg !15
  %81 = or disjoint i32 %72, 4096, !dbg !15
  %82 = or disjoint i32 %81, %70, !dbg !15
  %83 = getelementptr inbounds i8, ptr addrspace(3) @global_smem, i32 %82, !dbg !15
  store <8 x i8> %75, ptr addrspace(3) %83, align 8, !dbg !15
  %84 = or disjoint i32 %81, %77, !dbg !15
  %85 = getelementptr inbounds i8, ptr addrspace(3) @global_smem, i32 %84, !dbg !15
  store <8 x i8> %80, ptr addrspace(3) %85, align 8, !dbg !15
  %86 = lshr i32 %16, 1, !dbg !36
  %87 = xor i32 %86, %29, !dbg !36
  %88 = and i32 %87, 120, !dbg !36
  %89 = shl nuw nsw i32 %44, 7, !dbg !36
  %90 = or disjoint i32 %88, %89, !dbg !36
  %91 = getelementptr inbounds i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %90, !dbg !36
  store <8 x i8> %55, ptr addrspace(3) %91, align 8, !dbg !36
  %92 = icmp sgt i32 %21, 255, !dbg !13
  br i1 %92, label %.lr.ph, label %._crit_edge, !dbg !13

.lr.ph:                                           ; preds = %15
  %93 = lshr i32 %21, 7, !dbg !42
  %94 = shl nuw nsw i32 %42, 4
  %95 = and i32 %94, 48
  %96 = and i32 %16, 15
  %97 = and i32 %86, 24
  %98 = or disjoint i32 %95, %96
  %99 = or disjoint i32 %97, 32
  %100 = or disjoint i32 %97, 64
  %101 = or disjoint i32 %97, 96
  %102 = shl nuw nsw i32 %96, 3
  %103 = xor i32 %97, %102
  %104 = shl nuw nsw i32 %98, 7
  %105 = or disjoint i32 %104, %103
  %106 = xor i32 %99, %102
  %107 = or disjoint i32 %104, %106
  %108 = xor i32 %100, %102
  %109 = or disjoint i32 %104, %108
  %110 = xor i32 %101, %102
  %111 = or disjoint i32 %104, %110
  %112 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %105
  %113 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %107
  %114 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %109
  %115 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %111
  %116 = shl nuw nsw i32 %96, 7
  %117 = or disjoint i32 %103, %116
  %118 = or disjoint i32 %106, %116
  %119 = or disjoint i32 %108, %116
  %120 = or disjoint i32 %110, %116
  %121 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %117
  %122 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %118
  %123 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %119
  %124 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %120
  %125 = add nsw i32 %93, -2
  br label %126, !dbg !13

126:                                              ; preds = %.lr.ph, %126
  %.pn84104 = phi float [ %68, %.lr.ph ], [ %148, %126 ]
  %.pn82103 = phi float [ %58, %.lr.ph ], [ %146, %126 ]
  %.pn80102 = phi ptr addrspace(1) [ %50, %.lr.ph ], [ %138, %126 ]
  %.pn32101 = phi ptr addrspace(1) [ %20, %.lr.ph ], [ %130, %126 ]
  %127 = phi i32 [ 0, %.lr.ph ], [ %131, %126 ]
  %128 = phi <2 x float> [ zeroinitializer, %.lr.ph ], [ %173, %126 ]
  %129 = phi <2 x float> [ zeroinitializer, %.lr.ph ], [ %174, %126 ]
  %130 = getelementptr i8, ptr addrspace(1) %.pn32101, i64 128, !dbg !43
  %131 = add nuw nsw i32 %127, 1, !dbg !13
  %132 = shl i32 %131, 7, !dbg !44
  %133 = sub i32 %6, %132, !dbg !45
  %134 = icmp slt i32 %18, %133, !dbg !14
  %135 = insertelement <16 x i1> poison, i1 %134, i64 0, !dbg !15
  %136 = shufflevector <16 x i1> %135, <16 x i1> poison, <16 x i32> zeroinitializer, !dbg !15
  %137 = tail call <16 x i8> @llvm.masked.load.v16i8.p1(ptr addrspace(1) %130, i32 16, <16 x i1> %136, <16 x i8> zeroinitializer), !dbg !15
  %138 = getelementptr i8, ptr addrspace(1) %.pn80102, i64 128, !dbg !46
  %139 = icmp slt i32 %30, %133, !dbg !35
  %140 = insertelement <8 x i1> poison, i1 %139, i64 0, !dbg !36
  %141 = shufflevector <8 x i1> %140, <8 x i1> poison, <8 x i32> zeroinitializer, !dbg !36
  %142 = tail call <8 x i8> @llvm.masked.load.v8i8.p1(ptr addrspace(1) %138, i32 16, <8 x i1> %141, <8 x i8> zeroinitializer), !dbg !36
  %143 = sdiv i32 %132, %8, !dbg !47
  %144 = sext i32 %143 to i64, !dbg !48
  %145 = getelementptr float, ptr addrspace(1) %3, i64 %144, !dbg !48
  %unmaskedload = load <1 x float>, ptr addrspace(1) %145, align 4, !dbg !37
  %146 = extractelement <1 x float> %unmaskedload, i64 0, !dbg !37
  %147 = getelementptr float, ptr addrspace(1) %66, i64 %144, !dbg !49
  %unmaskedload94 = load <1 x float>, ptr addrspace(1) %147, align 4, !dbg !41
  %148 = extractelement <1 x float> %unmaskedload94, i64 0, !dbg !41
  fence syncscope("workgroup") release, !dbg !15
  tail call void @llvm.amdgcn.s.barrier(), !dbg !15
  fence syncscope("workgroup") acquire, !dbg !15
  %149 = load i64, ptr addrspace(3) %112, align 8, !dbg !15
  %150 = load i64, ptr addrspace(3) %113, align 8, !dbg !15
  %151 = load i64, ptr addrspace(3) %114, align 8, !dbg !15
  %152 = load i64, ptr addrspace(3) %115, align 8, !dbg !15
  %153 = load i64, ptr addrspace(3) %121, align 8, !dbg !36
  %154 = load i64, ptr addrspace(3) %122, align 8, !dbg !36
  %155 = load i64, ptr addrspace(3) %123, align 8, !dbg !36
  %156 = load i64, ptr addrspace(3) %124, align 8, !dbg !36
  %157 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %153, i64 %149, <4 x float> zeroinitializer, i32 0, i32 0, i32 0), !dbg !50
  %158 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %154, i64 %150, <4 x float> %157, i32 0, i32 0, i32 0), !dbg !50
  %159 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %155, i64 %151, <4 x float> %158, i32 0, i32 0, i32 0), !dbg !50
  %160 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %156, i64 %152, <4 x float> %159, i32 0, i32 0, i32 0), !dbg !50
  fence syncscope("workgroup") release, !dbg !15
  tail call void @llvm.amdgcn.s.barrier(), !dbg !15
  fence syncscope("workgroup") acquire, !dbg !15
  %161 = shufflevector <16 x i8> %137, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !15
  store <8 x i8> %161, ptr addrspace(3) %74, align 8, !dbg !15
  %162 = shufflevector <16 x i8> %137, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>, !dbg !15
  store <8 x i8> %162, ptr addrspace(3) %79, align 8, !dbg !15
  store <8 x i8> %161, ptr addrspace(3) %83, align 8, !dbg !15
  store <8 x i8> %162, ptr addrspace(3) %85, align 8, !dbg !15
  store <8 x i8> %142, ptr addrspace(3) %91, align 8, !dbg !36
  %163 = insertelement <2 x float> poison, float %.pn82103, i64 0, !dbg !51
  %164 = shufflevector <2 x float> %163, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !51
  %165 = shufflevector <4 x float> %160, <4 x float> poison, <2 x i32> <i32 0, i32 1>, !dbg !51
  %166 = fmul <2 x float> %164, %165, !dbg !51
  %167 = insertelement <2 x float> poison, float %.pn84104, i64 0, !dbg !52
  %168 = shufflevector <2 x float> %167, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !52
  %169 = fmul <2 x float> %168, %166, !dbg !52
  %170 = shufflevector <4 x float> %160, <4 x float> poison, <2 x i32> <i32 2, i32 3>, !dbg !51
  %171 = fmul <2 x float> %164, %170, !dbg !51
  %172 = fmul <2 x float> %168, %171, !dbg !52
  %173 = fadd <2 x float> %128, %169, !dbg !53
  %174 = fadd <2 x float> %129, %172, !dbg !53
  %exitcond.not = icmp eq i32 %127, %125, !dbg !13
  br i1 %exitcond.not, label %._crit_edge, label %126, !dbg !13

._crit_edge:                                      ; preds = %126, %15
  %.pn82.lcssa = phi float [ %58, %15 ], [ %146, %126 ]
  %.pn84.lcssa = phi float [ %68, %15 ], [ %148, %126 ]
  %175 = phi <2 x float> [ zeroinitializer, %15 ], [ %173, %126 ]
  %176 = phi <2 x float> [ zeroinitializer, %15 ], [ %174, %126 ]
  fence syncscope("workgroup") release, !dbg !15
  tail call void @llvm.amdgcn.s.barrier(), !dbg !15
  fence syncscope("workgroup") acquire, !dbg !15
  br i1 %22, label %177, label %._crit_edge._crit_edge, !dbg !50

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %.pre = and i32 %16, 15, !dbg !54
  br label %225, !dbg !50

177:                                              ; preds = %._crit_edge
  %178 = and i32 %86, 24, !dbg !15
  %179 = or disjoint i32 %178, 96, !dbg !15
  %180 = and i32 %16, 15, !dbg !15
  %181 = shl nuw nsw i32 %180, 3, !dbg !36
  %182 = xor i32 %179, %181, !dbg !36
  %183 = shl nuw nsw i32 %180, 7, !dbg !36
  %184 = or disjoint i32 %182, %183, !dbg !36
  %185 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %184, !dbg !36
  %186 = load i64, ptr addrspace(3) %185, align 8, !dbg !36
  %187 = or disjoint i32 %178, 64, !dbg !15
  %188 = xor i32 %187, %181, !dbg !36
  %189 = or disjoint i32 %188, %183, !dbg !36
  %190 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %189, !dbg !36
  %191 = load i64, ptr addrspace(3) %190, align 8, !dbg !36
  %192 = or disjoint i32 %178, 32, !dbg !15
  %193 = xor i32 %192, %181, !dbg !36
  %194 = or disjoint i32 %193, %183, !dbg !36
  %195 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %194, !dbg !36
  %196 = load i64, ptr addrspace(3) %195, align 8, !dbg !36
  %197 = xor i32 %178, %181, !dbg !36
  %198 = or disjoint i32 %197, %183, !dbg !36
  %199 = getelementptr i8, ptr addrspace(3) getelementptr (i8, ptr addrspace(3) @global_smem, i32 8192), i32 %198, !dbg !36
  %200 = load i64, ptr addrspace(3) %199, align 8, !dbg !36
  %201 = shl nuw nsw i32 %42, 4, !dbg !15
  %202 = and i32 %201, 48, !dbg !15
  %203 = or disjoint i32 %202, %180, !dbg !15
  %204 = shl nuw nsw i32 %203, 7, !dbg !15
  %205 = or disjoint i32 %204, %182, !dbg !15
  %206 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %205, !dbg !15
  %207 = load i64, ptr addrspace(3) %206, align 8, !dbg !15
  %208 = or disjoint i32 %204, %188, !dbg !15
  %209 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %208, !dbg !15
  %210 = load i64, ptr addrspace(3) %209, align 8, !dbg !15
  %211 = or disjoint i32 %204, %193, !dbg !15
  %212 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %211, !dbg !15
  %213 = load i64, ptr addrspace(3) %212, align 8, !dbg !15
  %214 = or disjoint i32 %204, %197, !dbg !15
  %215 = getelementptr i8, ptr addrspace(3) @global_smem, i32 %214, !dbg !15
  %216 = load i64, ptr addrspace(3) %215, align 8, !dbg !15
  %217 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %200, i64 %216, <4 x float> zeroinitializer, i32 0, i32 0, i32 0), !dbg !50
  %218 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %196, i64 %213, <4 x float> %217, i32 0, i32 0, i32 0), !dbg !50
  %219 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %191, i64 %210, <4 x float> %218, i32 0, i32 0, i32 0), !dbg !50
  %220 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %186, i64 %207, <4 x float> %219, i32 0, i32 0, i32 0), !dbg !50
  %221 = extractelement <4 x float> %220, i64 0, !dbg !50
  %222 = extractelement <4 x float> %220, i64 1, !dbg !50
  %223 = extractelement <4 x float> %220, i64 2, !dbg !50
  %224 = extractelement <4 x float> %220, i64 3, !dbg !50
  br label %225, !dbg !50

225:                                              ; preds = %._crit_edge._crit_edge, %177
  %.pre-phi = phi i32 [ %.pre, %._crit_edge._crit_edge ], [ %180, %177 ], !dbg !54
  %226 = phi float [ 0.000000e+00, %._crit_edge._crit_edge ], [ %221, %177 ], !dbg !50
  %227 = phi float [ 0.000000e+00, %._crit_edge._crit_edge ], [ %222, %177 ], !dbg !50
  %228 = phi float [ 0.000000e+00, %._crit_edge._crit_edge ], [ %223, %177 ], !dbg !50
  %229 = phi float [ 0.000000e+00, %._crit_edge._crit_edge ], [ %224, %177 ], !dbg !50
  %230 = srem i32 %31, %39, !dbg !55
  %231 = add i32 %230, %37, !dbg !56
  %232 = fmul float %.pn82.lcssa, %226, !dbg !51
  %233 = fmul float %.pn82.lcssa, %227, !dbg !51
  %234 = fmul float %.pn82.lcssa, %228, !dbg !51
  %235 = fmul float %.pn82.lcssa, %229, !dbg !51
  %236 = fmul float %.pn84.lcssa, %232, !dbg !52
  %237 = fmul float %.pn84.lcssa, %233, !dbg !52
  %238 = fmul float %.pn84.lcssa, %234, !dbg !52
  %239 = fmul float %.pn84.lcssa, %235, !dbg !52
  %240 = extractelement <2 x float> %175, i64 0, !dbg !53
  %241 = fadd float %240, %236, !dbg !53
  %242 = extractelement <2 x float> %175, i64 1, !dbg !53
  %243 = fadd float %242, %237, !dbg !53
  %244 = extractelement <2 x float> %176, i64 0, !dbg !53
  %245 = fadd float %244, %238, !dbg !53
  %246 = extractelement <2 x float> %176, i64 1, !dbg !53
  %247 = fadd float %246, %239, !dbg !53
  %248 = select i1 %22, float %241, float %240, !dbg !13
  %249 = select i1 %22, float %243, float %242, !dbg !13
  %250 = select i1 %22, float %245, float %244, !dbg !13
  %251 = select i1 %22, float %247, float %246, !dbg !13
  %252 = bitcast float %248 to i32, !dbg !57
  %253 = and i32 %252, 2139095040, !dbg !57
  %.not = icmp eq i32 %253, 2139095040, !dbg !57
  %254 = lshr i32 %252, 16, !dbg !57
  %255 = and i32 %254, 1, !dbg !57
  %256 = add nuw nsw i32 %255, 32767, !dbg !57
  %257 = select i1 %.not, i32 0, i32 %256, !dbg !57
  %258 = add i32 %257, %252, !dbg !57
  %259 = and i32 %252, 65535, !dbg !57
  %260 = icmp ne i32 %259, 0, !dbg !57
  %261 = and i1 %.not, %260, !dbg !57
  %262 = or i32 %252, 65536, !dbg !57
  %263 = select i1 %261, i32 %262, i32 %258, !dbg !57
  %264 = lshr i32 %263, 16, !dbg !57
  %265 = trunc nuw i32 %264 to i16, !dbg !57
  %266 = bitcast float %249 to i32, !dbg !57
  %267 = and i32 %266, 2139095040, !dbg !57
  %.not91 = icmp eq i32 %267, 2139095040, !dbg !57
  %268 = lshr i32 %266, 16, !dbg !57
  %269 = and i32 %268, 1, !dbg !57
  %270 = add nuw nsw i32 %269, 32767, !dbg !57
  %271 = select i1 %.not91, i32 0, i32 %270, !dbg !57
  %272 = add i32 %271, %266, !dbg !57
  %273 = and i32 %266, 65535, !dbg !57
  %274 = icmp ne i32 %273, 0, !dbg !57
  %275 = and i1 %.not91, %274, !dbg !57
  %276 = or i32 %266, 65536, !dbg !57
  %277 = select i1 %275, i32 %276, i32 %272, !dbg !57
  %278 = lshr i32 %277, 16, !dbg !57
  %279 = trunc nuw i32 %278 to i16, !dbg !57
  %280 = bitcast float %250 to i32, !dbg !57
  %281 = and i32 %280, 2139095040, !dbg !57
  %.not92 = icmp eq i32 %281, 2139095040, !dbg !57
  %282 = lshr i32 %280, 16, !dbg !57
  %283 = and i32 %282, 1, !dbg !57
  %284 = add nuw nsw i32 %283, 32767, !dbg !57
  %285 = select i1 %.not92, i32 0, i32 %284, !dbg !57
  %286 = add i32 %285, %280, !dbg !57
  %287 = and i32 %280, 65535, !dbg !57
  %288 = icmp ne i32 %287, 0, !dbg !57
  %289 = and i1 %.not92, %288, !dbg !57
  %290 = or i32 %280, 65536, !dbg !57
  %291 = select i1 %289, i32 %290, i32 %286, !dbg !57
  %292 = lshr i32 %291, 16, !dbg !57
  %293 = trunc nuw i32 %292 to i16, !dbg !57
  %294 = bitcast float %251 to i32, !dbg !57
  %295 = and i32 %294, 2139095040, !dbg !57
  %.not93 = icmp eq i32 %295, 2139095040, !dbg !57
  %296 = lshr i32 %294, 16, !dbg !57
  %297 = and i32 %296, 1, !dbg !57
  %298 = add nuw nsw i32 %297, 32767, !dbg !57
  %299 = select i1 %.not93, i32 0, i32 %298, !dbg !57
  %300 = add i32 %299, %294, !dbg !57
  %301 = and i32 %294, 65535, !dbg !57
  %302 = icmp ne i32 %301, 0, !dbg !57
  %303 = and i1 %.not93, %302, !dbg !57
  %304 = or i32 %294, 65536, !dbg !57
  %305 = select i1 %303, i32 %304, i32 %300, !dbg !57
  %306 = lshr i32 %305, 16, !dbg !57
  %307 = trunc nuw i32 %306 to i16, !dbg !57
  %308 = shl i32 %231, 6, !dbg !58
  %309 = and i32 %59, 16, !dbg !54
  %310 = or disjoint i32 %309, %.pre-phi, !dbg !54
  %311 = lshr i32 %16, 2, !dbg !54
  %312 = and i32 %311, 32, !dbg !54
  %313 = or disjoint i32 %310, %312, !dbg !54
  %314 = or disjoint i32 %308, %313, !dbg !59
  %315 = mul i32 %314, %11, !dbg !60
  %316 = sext i32 %315 to i64, !dbg !61
  %317 = getelementptr bfloat, ptr addrspace(1) %2, i64 %316, !dbg !61
  %318 = sext i32 %61 to i64, !dbg !62
  %319 = getelementptr bfloat, ptr addrspace(1) %317, i64 %318, !dbg !62
  %320 = icmp slt i32 %314, 1, !dbg !63
  %321 = icmp slt i32 %61, %5, !dbg !64
  %322 = and i1 %321, %320, !dbg !65
  %323 = insertelement <4 x i16> poison, i16 %265, i64 0, !dbg !66
  %324 = insertelement <4 x i16> %323, i16 %279, i64 1, !dbg !66
  %325 = insertelement <4 x i16> %324, i16 %293, i64 2, !dbg !66
  %326 = insertelement <4 x i16> %325, i16 %307, i64 3, !dbg !66
  %327 = bitcast <4 x i16> %326 to <4 x bfloat>, !dbg !66
  %328 = insertelement <4 x i1> poison, i1 %322, i64 0, !dbg !66
  %329 = shufflevector <4 x i1> %328, <4 x i1> poison, <4 x i32> zeroinitializer, !dbg !66
  tail call void @llvm.masked.store.v4bf16.p1(<4 x bfloat> %327, ptr addrspace(1) %319, i32 16, <4 x i1> %329), !dbg !66
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <1 x float> @llvm.masked.load.v1f32.p1(ptr addrspace(1) nocapture, i32 immarg, <1 x i1>, <1 x float>) #2

; Function Attrs: convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #3

; Function Attrs: convergent mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64, i64, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #4

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
!12 = !DILocation(line: 231, column: 36, scope: !4)
!13 = !DILocation(line: 231, column: 51, scope: !4)
!14 = !DILocation(line: 232, column: 51, scope: !4)
!15 = !DILocation(line: 232, column: 20, scope: !4)
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
!35 = !DILocation(line: 233, column: 51, scope: !4)
!36 = !DILocation(line: 233, column: 20, scope: !4)
!37 = !DILocation(line: 237, column: 22, scope: !4)
!38 = !DILocation(line: 226, column: 26, scope: !4)
!39 = !DILocation(line: 227, column: 30, scope: !4)
!40 = !DILocation(line: 227, column: 19, scope: !4)
!41 = !DILocation(line: 238, column: 22, scope: !4)
!42 = !DILocation(line: 40, column: 28, scope: !10, inlinedAt: !12)
!43 = !DILocation(line: 241, column: 18, scope: !4)
!44 = !DILocation(line: 232, column: 59, scope: !4)
!45 = !DILocation(line: 232, column: 55, scope: !4)
!46 = !DILocation(line: 242, column: 18, scope: !4)
!47 = !DILocation(line: 236, column: 29, scope: !4)
!48 = !DILocation(line: 237, column: 32, scope: !4)
!49 = !DILocation(line: 238, column: 32, scope: !4)
!50 = !DILocation(line: 240, column: 33, scope: !4)
!51 = !DILocation(line: 240, column: 38, scope: !4)
!52 = !DILocation(line: 240, column: 53, scope: !4)
!53 = !DILocation(line: 240, column: 23, scope: !4)
!54 = !DILocation(line: 251, column: 50, scope: !4)
!55 = !DILocation(line: 216, column: 33, scope: !4)
!56 = !DILocation(line: 216, column: 27, scope: !4)
!57 = !DILocation(line: 245, column: 27, scope: !4)
!58 = !DILocation(line: 251, column: 22, scope: !4)
!59 = !DILocation(line: 251, column: 37, scope: !4)
!60 = !DILocation(line: 253, column: 29, scope: !4)
!61 = !DILocation(line: 253, column: 17, scope: !4)
!62 = !DILocation(line: 253, column: 48, scope: !4)
!63 = !DILocation(line: 254, column: 33, scope: !4)
!64 = !DILocation(line: 254, column: 58, scope: !4)
!65 = !DILocation(line: 254, column: 39, scope: !4)
!66 = !DILocation(line: 255, column: 21, scope: !4)
!67 = !DILocation(line: 255, column: 4, scope: !4)
