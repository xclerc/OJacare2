(*	$Id: javaType.ml,v 1.2 2004/03/09 00:49:21 henry Exp $	*)

open Cidl
open Format

let rec output ppf typ =
  match typ with
  | Cboolean -> fprintf ppf "boolean"
  | Cchar -> fprintf ppf "char"
  | Cbyte -> fprintf ppf "byte"
  | Cshort -> fprintf ppf "short"
  | Cint -> fprintf ppf "int"
  | Ccamlint -> fprintf ppf "int"
  | Clong -> fprintf ppf "long"
  | Cfloat -> fprintf ppf "float"
  | Cdouble -> fprintf ppf "double"
  | Cobject Ctop -> fprintf ppf "Object"
  | Cobject Cstring -> fprintf ppf "String"
  | Cobject (Cname id) -> fprintf ppf "%s" (Ident.get_class_java_qualified_name id)
  | Cobject (Cjavaarray typ) -> fprintf ppf "%a[]" output typ
  | Cobject (Carray typ) -> fprintf ppf "%a[]" output typ
  | Cvoid -> fprintf ppf "void"
  | Ccallback id -> fprintf ppf "ICB_%s" (Ident.get_class_java_stub_name id)

