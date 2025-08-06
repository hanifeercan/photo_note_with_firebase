// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_photo_note_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addPhotoNoteHash() => r'2d2dad374c644e0c920cbb8f6044198fe88f46dd';

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

/// See also [addPhotoNote].
@ProviderFor(addPhotoNote)
const addPhotoNoteProvider = AddPhotoNoteFamily();

/// See also [addPhotoNote].
class AddPhotoNoteFamily extends Family<AsyncValue<void>> {
  /// See also [addPhotoNote].
  const AddPhotoNoteFamily();

  /// See also [addPhotoNote].
  AddPhotoNoteProvider call(String title, String desc, String imagePath) {
    return AddPhotoNoteProvider(title, desc, imagePath);
  }

  @override
  AddPhotoNoteProvider getProviderOverride(
    covariant AddPhotoNoteProvider provider,
  ) {
    return call(provider.title, provider.desc, provider.imagePath);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addPhotoNoteProvider';
}

/// See also [addPhotoNote].
class AddPhotoNoteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addPhotoNote].
  AddPhotoNoteProvider(String title, String desc, String imagePath)
    : this._internal(
        (ref) => addPhotoNote(ref as AddPhotoNoteRef, title, desc, imagePath),
        from: addPhotoNoteProvider,
        name: r'addPhotoNoteProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$addPhotoNoteHash,
        dependencies: AddPhotoNoteFamily._dependencies,
        allTransitiveDependencies:
            AddPhotoNoteFamily._allTransitiveDependencies,
        title: title,
        desc: desc,
        imagePath: imagePath,
      );

  AddPhotoNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.desc,
    required this.imagePath,
  }) : super.internal();

  final String title;
  final String desc;
  final String imagePath;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddPhotoNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddPhotoNoteProvider._internal(
        (ref) => create(ref as AddPhotoNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        desc: desc,
        imagePath: imagePath,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddPhotoNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddPhotoNoteProvider &&
        other.title == title &&
        other.desc == desc &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, desc.hashCode);
    hash = _SystemHash.combine(hash, imagePath.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddPhotoNoteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `desc` of this provider.
  String get desc;

  /// The parameter `imagePath` of this provider.
  String get imagePath;
}

class _AddPhotoNoteProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with AddPhotoNoteRef {
  _AddPhotoNoteProviderElement(super.provider);

  @override
  String get title => (origin as AddPhotoNoteProvider).title;
  @override
  String get desc => (origin as AddPhotoNoteProvider).desc;
  @override
  String get imagePath => (origin as AddPhotoNoteProvider).imagePath;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
