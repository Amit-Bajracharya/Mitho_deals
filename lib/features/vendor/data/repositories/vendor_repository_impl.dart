import 'package:dartz/dartz.dart';
import '../../domain/repository/vendor_repository.dart';
import '../../domain/entities/vendor_stats.dart';
import '../../../orders/domain/entity/order_entity.dart';
import '../../../deals/domain/entitiy/deal_entity.dart';
import '../datasource/vendor_remote_dataresource.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/vendor_stats_model.dart';

class VendorRepositoryImpl implements VendorRepository {
  final VendorRemoteDataSource remoteDataSource;

  VendorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, VendorStats>> getDashboardStats() async {
    try {
      final statsModel = await remoteDataSource.getDashboardStats();
      return Right(statsModel.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getActiveOrders() async {
    try {
      final orders = await remoteDataSource.getActiveOrders();
      return Right(orders.map((order) => order.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> fulfillOrder(String pickupCode) async {
    try {
      await remoteDataSource.fulfillOrder(pickupCode);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateShopStatus(bool isOpen) async {
    try {
      await remoteDataSource.updateShopStatus(isOpen);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateLocation(double lat, double lng) async {
    try {
      await remoteDataSource.updateLocation(lat, lng);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<DealEntity>>> getMyDeals() async {
    try {
      final deals = await remoteDataSource.getMyDeals();
      return Right(deals.map((deal) => deal.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCurrentVendorProfile() async {
    try {
      final profile = await remoteDataSource.getCurrentVendorProfile();
      return Right(profile);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}
