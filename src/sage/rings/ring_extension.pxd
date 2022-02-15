from sage.categories.map cimport Map
from sage.rings.ring cimport CommutativeRing, CommutativeAlgebra
from sage.rings.ring_extension cimport RingExtension_generic
from sage.rings.ring_extension_morphism cimport RingExtensionBackendIsomorphism, RingExtensionBackendReverseIsomorphism


cdef class RingExtension_generic(CommutativeAlgebra):
    cdef _type
    cdef public _backend
    cdef RingExtensionBackendIsomorphism _from_backend_morphism
    cdef RingExtensionBackendReverseIsomorphism _to_backend_morphism
    cdef _defining_morphism
    cdef _backend_defining_morphism
    cdef dict _print_options
    cdef bint _import_methods
    cdef bint _is_backend_exposed
    # For division
    cdef RingExtension_generic _fraction_field
    cdef type _fraction_field_type

    cpdef is_defined_over(self, base)
    cpdef CommutativeRing _check_base(self, CommutativeRing base)
    cpdef _degree_over(self, CommutativeRing base)
    cpdef _is_finite_over(self, CommutativeRing base)
    cpdef _is_free_over(self, CommutativeRing base)
    cdef Map _defining_morphism_fraction_field(self, bint extend_base)


cdef class RingExtensionFractionField(RingExtension_generic):
    cdef _ring


cdef class RingExtensionWithBasis(RingExtension_generic):
    cdef _basis
    cdef _basis_names
    cdef _basis_latex_names

    cpdef _basis_over(self, CommutativeRing base)
    # cpdef _free_module(self, CommutativeRing base, bint map)


cdef class RingExtensionWithGen(RingExtensionWithBasis):
    cdef _gen
    cdef _name
