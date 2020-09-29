-- Copyright (c) 2020, Shayne Fletcher. All rights reserved.
-- SPDX-License-Identifier: BSD-3-Clause.
{-# LANGUAGE CPP #-}
#include "ghclib_api.h"
module Language.Haskell.GhclibParserEx.GHC.Hs.ImpExp(
    isPatSynIE
#if defined (MIN_VERSION_ghc_lib_parser)
#  if !MIN_VERSION_ghc_lib_parser(1,  0,  0) || MIN_VERSION_ghc_lib_parser(9, 0, 0) || MIN_VERSION_ghc_lib_parser(8, 10, 0)
 , isImportQualifiedPost
#  endif
#elif  __GLASGOW_HASKELL__ >= 810
 , isImportQualifiedPost
#endif
  )
where

#if defined (GHCLIB_API_HEAD) || defined (GHCLIB_API_900)
import GHC.Hs.ImpExp
import GHC.Types.Name.Reader
#elif defined (GHCLIB_API_810)
import GHC.Hs.ImpExp
import RdrName
#else
import HsImpExp
import RdrName
#endif

isPatSynIE :: IEWrappedName RdrName -> Bool
isPatSynIE IEPattern{} = True
isPatSynIE _ = False

#if defined(MIN_VERSION_ghc_lib_parser)
#  if !MIN_VERSION_ghc_lib_parser(1,  0,  0) || MIN_VERSION_ghc_lib_parser(9, 0, 0) | MIN_VERSION_ghc_lib_parser(8, 10, 0)
isImportQualifiedPost :: ImportDeclQualifiedStyle -> Bool
isImportQualifiedPost QualifiedPost = True
isImportQualifiedPost _  = False
#  endif
#elif __GLASGOW_HASKELL__ >= 810
isImportQualifiedPost :: ImportDeclQualifiedStyle -> Bool
isImportQualifiedPost QualifiedPost = True
isImportQualifiedPost _  = False
#endif
