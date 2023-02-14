// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_dislike_post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likeDislikePostHash() => r'da48c83d11c2b977f5133ad305f5f87d0bb0f607';

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

typedef LikeDislikePostRef = AutoDisposeFutureProviderRef<bool>;

/// See also [likeDislikePost].
@ProviderFor(likeDislikePost)
const likeDislikePostProvider = LikeDislikePostFamily();

/// See also [likeDislikePost].
class LikeDislikePostFamily extends Family<AsyncValue<bool>> {
  /// See also [likeDislikePost].
  const LikeDislikePostFamily();

  /// See also [likeDislikePost].
  LikeDislikePostProvider call({
    required LikeDislikeRequest request,
  }) {
    return LikeDislikePostProvider(
      request: request,
    );
  }

  @override
  LikeDislikePostProvider getProviderOverride(
    covariant LikeDislikePostProvider provider,
  ) {
    return call(
      request: provider.request,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'likeDislikePostProvider';
}

/// See also [likeDislikePost].
class LikeDislikePostProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [likeDislikePost].
  LikeDislikePostProvider({
    required this.request,
  }) : super.internal(
          (ref) => likeDislikePost(
            ref,
            request: request,
          ),
          from: likeDislikePostProvider,
          name: r'likeDislikePostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likeDislikePostHash,
          dependencies: LikeDislikePostFamily._dependencies,
          allTransitiveDependencies:
              LikeDislikePostFamily._allTransitiveDependencies,
        );

  final LikeDislikeRequest request;

  @override
  bool operator ==(Object other) {
    return other is LikeDislikePostProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
