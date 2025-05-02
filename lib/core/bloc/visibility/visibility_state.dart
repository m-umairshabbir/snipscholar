part of 'visibility_bloc.dart';
class VisibilityState extends Equatable {
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;

  const VisibilityState({
    this.isPasswordVisible = true,
    this.isConfirmPasswordVisible = true,
  });

  VisibilityState copyWith({
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return VisibilityState(
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
        isConfirmPasswordVisible:
            isConfirmPasswordVisible ?? this.isConfirmPasswordVisible);
  }

  @override
  List<Object> get props => [isPasswordVisible, isConfirmPasswordVisible];
}
