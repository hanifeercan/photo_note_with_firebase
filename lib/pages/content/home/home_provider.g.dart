// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPhotoNotesHash() => r'b0274b92d7cbdd02771adad391407fd0cd90610b';

/// See also [getPhotoNotes].
@ProviderFor(getPhotoNotes)
final getPhotoNotesProvider =
    AutoDisposeFutureProvider<List<PhotoNote>>.internal(
      getPhotoNotes,
      name: r'getPhotoNotesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getPhotoNotesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPhotoNotesRef = AutoDisposeFutureProviderRef<List<PhotoNote>>;
String _$removePhotoNoteHash() => r'25355d036af557b683ae541c0036abe7999a2d2d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [removePhotoNote].
@ProviderFor(removePhotoNote)
const removePhotoNoteProvider = RemovePhotoNoteFamily();

/// See also [removePhotoNote].
class RemovePhotoNoteFamily extends Family<AsyncValue<void>> {
  /// See also [removePhotoNote].
  const RemovePhotoNoteFamily();

  /// See also [removePhotoNote].
  RemovePhotoNoteProvider call(String id) {
    return RemovePhotoNoteProvider(id);
  }

  @override
  RemovePhotoNoteProvider getProviderOverride(
    covariant RemovePhotoNoteProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removePhotoNoteProvider';
}

/// See also [removePhotoNote].
class RemovePhotoNoteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [removePhotoNote].
  RemovePhotoNoteProvider(String id)
    : this._internal(
        (ref) => removePhotoNote(ref as RemovePhotoNoteRef, id),
        from: removePhotoNoteProvider,
        name: r'removePhotoNoteProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$removePhotoNoteHash,
        dependencies: RemovePhotoNoteFamily._dependencies,
        allTransitiveDependencies:
            RemovePhotoNoteFamily._allTransitiveDependencies,
        id: id,
      );

  RemovePhotoNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<void> Function(RemovePhotoNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemovePhotoNoteProvider._internal(
        (ref) => create(ref as RemovePhotoNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemovePhotoNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemovePhotoNoteProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RemovePhotoNoteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;
}

class _RemovePhotoNoteProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with RemovePhotoNoteRef {
  _RemovePhotoNoteProviderElement(super.provider);

  @override
  String get id => (origin as RemovePhotoNoteProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
