project(GameplayKit)

set(DYLIB_COMPAT_VERSION "1.0.0")
set(DYLIB_CURRENT_VERSION "1.0.0")
set(FRAMEWORK_VERSION "A")

remove_sdk_framework(GameplayKit
)

generate_sdk_framework(GameplayKit
    VERSION ${FRAMEWORK_VERSION}
    HEADER "include/GameplayKit"
)

add_framework(GameplayKit
    FAT
    CURRENT_VERSION
    VERSION ${FRAMEWORK_VERSION}

    SOURCES
        src/GameplayKit.m
        src/GKRTree.m
        src/GKSKNodeComponent.m
        src/GKARC4RandomSource.m
        src/GKRandomDistribution.m
        src/GKGaussianDistribution.m
        src/GKShuffledDistribution.m
        src/GKCylindersNoiseSource.m
        src/GKNoiseMap.m
        src/GKMeshGraph.m
        src/GKMinmaxStrategist.m
        src/GKLinearCongruentialRandomSource.m
        src/GKMonteCarloStrategist.m
        src/GKEntity.m
        src/GKCheckerboardNoiseSource.m
        src/GKObstacle.m
        src/GKCircleObstacle.m
        src/GKPolygonObstacle.m
        src/GKSphereObstacle.m
        src/GKSystemArc4RandomSource.m
        src/GKRandomSource.m
        src/GKBillowNoiseSource.m
        src/GKDecisionNode.m
        src/GKDecisionTree.m
        src/GKAgent.m
        src/GKAgent2D.m
        src/GKAgent3D.m
        src/GKHybridStrategist.m
        src/GKRuleSystem.m
        src/_GKBlockRule.m
        src/GKRule.m
        src/_GKNSBoolPredicateTemplate.m
        src/_GKNSKeypathPredicateTemplate.m
        src/GKNSPredicateRule.m
        src/_GKNSPredicateRule.m
        src/GKGraph.m
        src/GKRidgedNoiseSource.m
        src/GKQuadtreeNode.m
        src/GKQuadtree.m
        src/GKVoronoiNoiseSource.m
        src/GKNoiseSource.m
        src/GKNoiseSourceUtils.m
        src/GKNoise.m
        src/GKNoiseModifier.m
        src/GKAbsoluteValueNoiseModifier.m
        src/GKClampNoiseModifier.m
        src/GKConstantPowerNoiseModifier.m
        src/GKInvertNoiseModifier.m
        src/GKTurbulenceNoiseModifier.m
        src/GKCurveNoiseModifier.m
        src/GKTerraceNoiseModifier.m
        src/GKMoveNoiseModifier.m
        src/GKScaleNoiseModifier.m
        src/GKRotateNoiseModifier.m
        src/GKAddNoiseModifier.m
        src/GKMultiplyNoiseModifier.m
        src/GKMinimumNoiseModifier.m
        src/GKMaximumNoiseModifier.m
        src/GKPowerNoiseModifier.m
        src/GKDisplaceNoiseModifier.m
        src/GKBlendNoiseModifier.m
        src/GKState.m
        src/GKCoherentNoiseSource.m
        src/GKComponent.m
        src/GKComponentSystem.m
        src/GKGraphNode.m
        src/GKGraphNode2D.m
        src/GKGraphNode3D.m
        src/GKGridGraphNode.m
        src/GKConstantNoiseSource.m
        src/GKPerlinNoiseSource.m
        src/GKOctreeNode.m
        src/GKOctree.m
        src/GKStateMachine.m
        src/GKBehavior.m
        src/GKPath.m
        src/GKGoal.m
        src/GKSpheresNoiseSource.m
        src/GKSCNNodeComponent.m
        src/GKCompositeBehavior.m
        src/GKObstacleGraph.m
        src/GKScene.m
        src/GKCustomClassUnarchiver.m
        src/GKGridGraph.m
        src/GKMersenneTwisterRandomSource.m

    DEPENDENCIES
        system
        objc
        Foundation
)
